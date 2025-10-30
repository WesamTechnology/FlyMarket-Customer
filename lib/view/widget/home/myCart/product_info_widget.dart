import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/view/widget/getResponsiveTextSize.dart';

import '../../../../core/constant/color.dart';


class Productinfowidget extends StatelessWidget {
  const Productinfowidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bell Pepper Red",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 5.h),
        Text("1kg, Price", style: TextStyle(
          color: AppColor.grey,
          fontSize: 12.sp,
        ),),
        SizedBox(height: 15.h),
        Row(
          children: [
            Container(
              height: 28.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
                border: Border.all(
                  width: 0.5,
                  color: AppColor.grey,
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.remove,
                  color: AppColor.grey,
                ),
              ),
            ),
            SizedBox(width: 15.w),
            Text(
              "2",
              style: TextStyle(
                color: Colors.black,
                fontSize:16.sp,
              ),
            ),
            SizedBox(width: 15.w),
            Container(
              height: 28.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
                border: Border.all(
                  width: 0.5,
                  color: AppColor.grey,
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
