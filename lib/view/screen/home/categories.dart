import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10).r,
        child: Column(
          children: [
            SizedBox(height: 50),
             Text(
              "Categories",
              style: TextStyle(
                  fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColor.black),
            ),
            SizedBox(height: 17.h),
            CustomSearch(),
            SizedBox(height: 17.h),
            CustomGridviewCategories(),
          ],
        ),
      ),
    );
  }
}
