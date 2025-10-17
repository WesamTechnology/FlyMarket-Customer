import 'package:flutter/material.dart';
import 'package:flymarket_customer/core/constant/color.dart';
import 'package:flymarket_customer/core/constant/imgaeasset.dart';
import 'package:flymarket_customer/view/widget/home/categories/custom_Search.dart';
import 'package:flymarket_customer/view/widget/home/categories/custom_gridview_categories.dart';
import 'package:flymarket_customer/view/widget/home/home_page/custom_gridview.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 50),
             Text(
              "Categories",
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: AppColor.black),
            ),
            SizedBox(height: 20),
            CustomSearch(),
            SizedBox(height: 20),
            CustomGridviewCategories(),
          ],
        ),
      ),
    );
  }
}
