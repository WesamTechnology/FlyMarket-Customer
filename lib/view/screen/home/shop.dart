import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/controller/home/home_shop_controller.dart';
import 'package:flymarket_customer/core/class/handlingdataview.dart';
import 'package:flymarket_customer/core/constant/color.dart';
import 'package:flymarket_customer/view/screen/home/supermarket_map_view.dart';
import 'package:flymarket_customer/view/widget/home/home_page/custom_gridview.dart';
import 'package:flymarket_customer/view/widget/home/home_page/custom_sarouselslider.dart';
import 'package:get/get.dart';

import '../../../core/functions/translate_database.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeShopControllerImp());
    return Scaffold(
      body: GetBuilder<HomeShopControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 10,
              ).r,
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    "FlyMarket",
                    style: TextStyle(color: AppColor.primaryColor, fontSize: 19.sp,fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 17.h),
                  Expanded(child: ImageSliderPage()),
                  SizedBox(height: 17.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        translateDatabase("المتاجر", "The Shops"),
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 21.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // 🔥 زر الخريطة
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SupermarketMapView());
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.map, color: Colors.white, size: 18),
                              SizedBox(width: 5),
                              Text(
                                translateDatabase("الخريطة", "Map"),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 17.h),
                  Expanded(flex: 2, child: CustomGridview()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
