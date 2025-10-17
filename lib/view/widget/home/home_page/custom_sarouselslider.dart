import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flymarket_customer/core/constant/imgaeasset.dart';

class ImageSliderPage extends StatelessWidget {
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
          height: 170.0, // ارتفاع السلايدر
          autoPlay: true, // التشغيل التلقائي
          enlargeCenterPage: true,   // تكبير الصورة الحالية
          aspectRatio: 16 / 9,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,     // نسبة عرض العنصر الواحد
        ),
        items: imageList.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  item,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
