import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/statuserequest.dart';
import '../../core/functions/get_osrm_route.dart';
import '../../core/services/services.dart';
import '../../data/model/orders/order_pending_model.dart';

class OrderTrackingController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  late OrderPendingModel orderPendingModel;
  MyServices myServices = Get.find();
  CameraPosition? cameraPosition;
  GoogleMapController? gmc;
  Set<Polyline> polylineSet = {};

  List<Marker> marker = [];
  List<Circle> circles = [];

  double? destLat;
  double? destLong;
  double? currentLat;
  double? currentLong;

  getCurrentLocation() async {
    //if (orderPendingModel.addressId == null) return;
    cameraPosition = CameraPosition(
      target: LatLng(
        orderPendingModel.addressLat!,
        orderPendingModel.addressLong!,
      ),

      zoom: 16.4746,
    );
    circles.add(
      Circle(
        circleId: CircleId("dest"),
        center: LatLng(orderPendingModel.addressLat!,
          orderPendingModel.addressLong!,),
        radius: 20,
        // حجم الدائرة
        fillColor: Colors.blue,
        strokeColor: Colors.white,
        strokeWidth: 3,
      ),
    );
    //if (isClosed) return;
    await getLocationDelivery();
    update();
  }

  initPolyLine() async {

    if (currentLat == null || currentLong == null) return;

    polylineSet = await getRouteOSRM(
      startLat: currentLat!,
      startLng: currentLong!,
      endLat: orderPendingModel.addressLat!,
      endLng: orderPendingModel.addressLong!,
    );

    update();
  }


  getLocationDelivery(){
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(orderPendingModel.ordersId.toString()).snapshots().listen(
        (event){
          if(event.exists){
            currentLat = event.data()!['lat'];
            currentLong = event.data()!['long'];
            print("================================================");
            print(orderPendingModel.ordersId.toString());
            print(currentLat);
            print(currentLong);
            print("================================================");
            updateMarkerDelivery(currentLat!, currentLong!);
            initPolyLine();
          }
        }
    );
  }

  updateMarkerDelivery(double newLat, double newLong){
    marker.removeWhere((element) => element.markerId.value == "current");
    marker.add(
      Marker(
        markerId: MarkerId("current"),
        position: LatLng(newLat, newLong),

      ),
    );
    update();
  }


  @override
  void onInit() {
    orderPendingModel = Get.arguments['ordersmodel'];

    getCurrentLocation();
    //getLocationDelivery();
    //initPolyLine();
    //refreshLocation();
    super.onInit();
  }

  @override
  void onClose() {
     // إيقاف الاستماع للموقع
    gmc = null; // تفريغ متحكم الخريطة

    super.onClose();
  }
}
