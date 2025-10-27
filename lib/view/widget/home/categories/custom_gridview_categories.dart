import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/view/screen/home/CategoryDetailPages/bakery_snacks.dart';
import 'package:flymarket_customer/view/screen/home/CategoryDetailPages/beverages.dart';
import 'package:flymarket_customer/view/screen/home/CategoryDetailPages/fruits_vegetable.dart';
import 'package:flymarket_customer/view/screen/home/CategoryDetailPages/meat_fish.dart';
import 'package:flymarket_customer/view/screen/home/CategoryDetailPages/oil_ghee.dart';
import 'package:get/get.dart';

import '../../../../core/constant/imgaeasset.dart';
import '../../../screen/home/CategoryDetailPages/dairy_eggs.dart';

class CustomGridviewCategories extends StatelessWidget {
  const CustomGridviewCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'title': 'Fresh Fruits & Vegetable',
        'image': AppImageAsset.fruits,
        'color': const Color(0xFFEFF8F1),
        'borderColor': const Color(0xFF9DE09C),
      },
      {
        'title': 'Cooking Oil & Ghee',
        'image': AppImageAsset.oil,
        'color': const Color(0xFFFFF6ED),
        'borderColor': const Color(0xFFFAC89C),
      },
      {
        'title': 'Meat & Fish',
        'image': AppImageAsset.meat,
        'color': const Color(0xFFFFEFEF),
        'borderColor': const Color(0xFFFFB8B8),
      },
      {
        'title': 'Bakery & Snacks',
        'image': AppImageAsset.bakery,
        'color': const Color(0xFFF7F1FF),
        'borderColor': const Color(0xFFD1B4F8),
      },
      {
        'title': 'Dairy & Eggs',
        'image': AppImageAsset.dairy,
        'color': const Color(0xFFFFF9E8),
        'borderColor': const Color(0xFFF6D87E),
      },
      {
        'title': 'Beverages',
        'image': AppImageAsset.beverages,
        'color': const Color(0xFFEFF8FF),
        'borderColor': const Color(0xFFA7D6FF),
      },
    ];

    final List CategoryDetailClass = [
      FruitsVegetable(),
      OilGhee(),
      MeatFish(),
      BakerySnacks(),
      DairyEggs(),
      Beverages(),




    ];


    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7).r,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13.w,
          mainAxisSpacing: 13.h,
          childAspectRatio: 0.65.h,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return InkWell(
            onTap: (){
              Get.to(CategoryDetailClass[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                color: item['color'],
                borderRadius: BorderRadius.circular(20).r,
                border: Border.all(color: item['borderColor'], width: 1.2.w),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(7.0).r,
                      child: Image.asset(
                        item['image'],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12).r,
                    child: Text(
                      item['title'],
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
