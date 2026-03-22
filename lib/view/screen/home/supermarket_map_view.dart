import 'package:flutter/material.dart';
import 'package:flymarket_customer/link_api.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/home/home_shop_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translate_database.dart';
import '../../../data/model/supermarket_model.dart';

class SupermarketMapView extends StatelessWidget {
  const SupermarketMapView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeShopControllerImp>();

    return GetBuilder<HomeShopControllerImp>(
      id: "map",
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(translateDatabase("خريطة السوبرات", "Supermarkets Map"),),
            backgroundColor: AppColor.primaryColor,
          ),
          body: Stack(
            children: [
              // 🗺️ الخريطة
              GoogleMap(
                myLocationEnabled: false, // لأنك تستخدم ماركر خاص
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    controller.userLat ?? 15.3,
                    controller.userLng ?? 44.2,
                  ),
                  zoom: 13,
                ),
                markers: controller.markers.toSet(),
                onMapCreated: (mapController) {
                  controller.gmc = mapController;
                },
              ),

              // 🔥 كرت السوبر الأقرب
              if (controller.supermarket.isNotEmpty)
                Positioned(
                  bottom: 20,
                  right: 15,
                  left: 15,
                  child: _buildNearestCard(controller),
                ),
              if (controller.selectedMarket != null)
                Positioned(
                  top: 20,
                  right: 15,
                  left: 15,
                  child: buildCustomInfo(controller),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNearestCard(HomeShopControllerImp controller) {
    var nearest = controller.supermarket.first;
    var nearestModel = SupermarketModel.fromJson(nearest);

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
        ],
      ),
      child: Row(
        children: [
          // 🏪 صورة
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "${AppLink.imageSupermarket}${nearestModel.supermarketImage}",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Icon(Icons.store, size: 50),
            ),
          ),

          SizedBox(width: 10),

          // 📝 معلومات
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  translateDatabase(
                    nearest['supermarket_name_ar'],
                    nearest['supermarket_name'],
                  ),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 5),

                Text(translateDatabase("الأقرب إليك 📍", "Nearest to you 📍"), style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          // 🔥 زر دخول
          ElevatedButton(
            onPressed: () {
              controller.goToCategories(
                controller.supermarket,
                0,
                nearest['supermarket_id'].toString(),
                nearestModel,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
            ),
            child: Text(translateDatabase("دخول", "Open"), style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget buildCustomInfo(HomeShopControllerImp controller) {
    var market = controller.selectedMarket!;
    double distance = (market['distance'] ?? 0) / 1000; // كم

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // 🏪 الصورة
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "${AppLink.imageSupermarket}/${market['supermarket_image']}",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 80,
                height: 80,
                color: Colors.grey.shade200,
                child: Icon(Icons.store, size: 40, color: Colors.grey),
              ),
            ),
          ),

          SizedBox(width: 12),

          // 📝 التفاصيل
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🏪 الاسم
                Text(
                  translateDatabase(
                    market['supermarket_name_ar'],
                    market['supermarket_name'],
                  ),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 6),

                // 📍 الموقع + المسافة
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.red),
                    SizedBox(width: 4),
                    Text(
                      "${distance.toStringAsFixed(1)} كم",
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ),

                SizedBox(height: 6),

                // 🟢 الحالة
              ],
            ),
          ),

          SizedBox(width: 10),

          // 🔥 زر الدخول
          GestureDetector(
            onTap: () {
              controller.goToCategories(
                controller.supermarket,
                controller.supermarket.indexOf(market),
                market['supermarket_id'].toString(),
                SupermarketModel.fromJson(Map<String, dynamic>.from(market)),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primaryColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(
                    translateDatabase("دخول", "Open"),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
