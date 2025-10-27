import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/view/widget/home/CategoryDetailWidget/custom_category_detail_pages.dart';
import 'package:flymarket_customer/view/widget/home/categories/custom_Search.dart';


class BakerySnacks extends StatelessWidget {
  const BakerySnacks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(7.0).r,
        child: Column(
          children: [
            SizedBox(height: 60.h,),
            CustomSearch(),
            SizedBox(height: 10.h,),
            CustomCategoryDetailPages(),
          ],
        ),
      )
    );
  }
}
