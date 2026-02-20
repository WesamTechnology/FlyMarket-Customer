import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class Custombuttonauth extends StatelessWidget {
  const Custombuttonauth({super.key, required this.text, this.onTap});
final String text;
final void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15).r,
        width: double.infinity,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColor.backgroundcolor),
        ),
      ),
    );
  }
}
