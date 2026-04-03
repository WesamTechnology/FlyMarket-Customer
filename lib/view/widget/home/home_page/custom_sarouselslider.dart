import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/imgaeasset.dart';
import 'package:get/get.dart';

import '../../../../controller/home/home_shop_controller.dart';
import '../../../../link_api.dart';

class ImageSliderPage extends GetView<HomeShopControllerImp> {
  final List<String> imageList = [
    AppImageAsset.slider1,
    AppImageAsset.slider2,
    AppImageAsset.slider3,
    AppImageAsset.slider4,
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 140.0.h, // ارتفاع السلايدر
          autoPlay: true, // التشغيل التلقائي
          enlargeCenterPage: true,   // تكبير الصورة الحالية
          aspectRatio: 16 / 9,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.75.w,      // نسبة عرض العنصر الواحد
        ),
        items: controller.banners.isEmpty ? imageList.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15).r,
                child: Image.asset(
                  item,

                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              );
            },
          );
        }).toList() : controller.banners.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15).r,
                child: Image.network(
                  "${AppLink.banners}/${item["banners_image"]}",

                  fit: BoxFit.fill,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    AppImageAsset.splash2,
                    fit: BoxFit.fill),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
