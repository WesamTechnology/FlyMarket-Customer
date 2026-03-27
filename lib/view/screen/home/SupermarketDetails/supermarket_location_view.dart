import 'package:flutter/material.dart';
import 'package:flymarket_customer/core/constant/color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flymarket_customer/data/model/supermarket_model.dart';
import 'package:get/get.dart';
import 'package:flymarket_customer/core/functions/get_osrm_route.dart';
import 'package:flymarket_customer/controller/home/home_shop_controller.dart';

import '../../../../core/functions/translate_database.dart';

class SupermarketLocationView extends StatefulWidget {
  final SupermarketModel supermarketModel;

  const SupermarketLocationView({
    super.key,
    required this.supermarketModel,
  });

  @override
  State<SupermarketLocationView> createState() => _SupermarketLocationViewState();
}

class _SupermarketLocationViewState extends State<SupermarketLocationView> {

  final homeController = Get.find<HomeShopControllerImp>();

  Set<Marker> markers = {};
  Set<Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    initMap();
  }

  Future<void> initMap() async {

    double? userLat = homeController.userLat;
    double? userLng = homeController.userLng;

    double marketLat = widget.supermarketModel.supermarketLat!;
    double marketLng = widget.supermarketModel.supermarketLong!;

    // 📍 ماركر المستخدم (🔥 نفس الصورة)
    if (userLat != null && userLng != null) {
      markers.add(
        Marker(
          markerId: MarkerId("user"),
          position: LatLng(userLat, userLng),
          icon: homeController.userIcon ?? BitmapDescriptor.defaultMarker,
          anchor: Offset(0.5, 0.5),
          flat: true,
          rotation: homeController.userRotation,
        ),
      );
    }

    // 🏪 ماركر السوبر
    markers.add(
      Marker(
        markerId: MarkerId("market"),
        position: LatLng(marketLat, marketLng),
      ),
    );

    // 🛣️ الطريق
    if (userLat != null && userLng != null) {
      polylines = await getRouteOSRM(
        startLat: userLat,
        startLng: userLng,
        endLat: marketLat,
        endLng: marketLng,
      );
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double marketLat = widget.supermarketModel.supermarketLat!;
    double marketLng = widget.supermarketModel.supermarketLong!;

    return Scaffold(
      appBar: AppBar(title: Text(translateDatabase("الموقع", "Location"),style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold),),centerTitle: true,),
      body: GetBuilder<HomeShopControllerImp>(
        id: "map",
        builder: (controller) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                controller.userLat ?? marketLat,
                controller.userLng ?? marketLng,
              ),
              zoom: 14,
            ),
            markers: controller.markers.toSet(), // 🔥 هذا المهم
            polylines: polylines,
          );
        },
      )
    );
  }
}