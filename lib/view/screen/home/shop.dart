import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/color.dart';
import 'package:flymarket_customer/view/widget/home/home_page/custom_gridview.dart';
import 'package:flymarket_customer/view/widget/home/home_page/custom_sarouselslider.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10).r,
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Text(
              "Order to",
              style: TextStyle(color: AppColor.black, fontSize: 18.sp),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.location_on), Text("Yemen, Sanaa")],
            ),
            SizedBox(height: 17.h),
            Expanded(child: ImageSliderPage()),
            SizedBox(height: 17.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "The Shop",
                  style: TextStyle(color: AppColor.black, fontSize: 20.sp),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu, size: 25.r),
                ),
              ],
            ),
            SizedBox(height: 17.h),
            Expanded(flex: 2,child: CustomGridview()),
          ],
        ),
      ),
    );
  }
}
