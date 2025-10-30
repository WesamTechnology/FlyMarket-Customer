import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/color.dart';


class CustomButtonCart extends StatelessWidget {
  const CustomButtonCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20.h,
        top: 10.h,
        right: 30.w,
        left: 30.w,
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Buy Now ${"\$"} 1000",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50.h),
          backgroundColor: AppColor.primaryColor,
        ),
      ),
    );
  }
}
