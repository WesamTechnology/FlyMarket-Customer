import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/color.dart';


class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title});
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: AppColor.primaryColor, fontSize: 20.sp,fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),
        Divider(color: Colors.grey[400],),
      ],
    );
  }
}
