import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.95,
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
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: item['borderColor'], width: 1.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        item['image'],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      item['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
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
