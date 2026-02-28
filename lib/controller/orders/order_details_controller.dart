import 'dart:async';


import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/statuserequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/orders_details_data.dart';
import '../../data/model/orders/order_pending_model.dart';
import '../../data/model/orders/orders_details_model.dart';

class OrderDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loding;
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  late OrderPendingModel orderPendingModel;
  MyServices myServices = Get.find();
  List<OrdersDetailsModel> listData= [];


  CameraPosition? cameraPosition;
  Completer<GoogleMapController>? completerController ;

  List<Marker> marker = [];

  intialData() {
    if (orderPendingModel.addressId == null) return ;
    cameraPosition = CameraPosition(
      target: LatLng(orderPendingModel.addressLat!, orderPendingModel.addressLong!),

      zoom: 14.4746,
    );
    marker.add(
      Marker(
        markerId: MarkerId("1"),
        position: LatLng(
            orderPendingModel.addressLat!, orderPendingModel.addressLong!
        ),
      ),
    );
  }

  getData() async {
    listData.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await ordersDetailsData.getData(
     orderPendingModel.ordersId.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List resonseData = response['data'];
        listData.addAll(resonseData.map((e) => OrdersDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    orderPendingModel = Get.arguments['ordersmodel'];
    completerController =
        Completer<GoogleMapController>();
    intialData();
    getData();
    super.onInit();
  }
}
