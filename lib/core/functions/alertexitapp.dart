import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/color.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() async {
  bool? confirmExit = await Get.dialog<bool>(
    AlertDialog(
      title: Row(
        children: [
          Icon(Icons.exit_to_app, color: AppColor.primaryColor),
          SizedBox(width: 8.w),
          Text(
            'Exit App',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      content: Text(
        'Are you sure you want to exit the app?',
        style: TextStyle(fontSize: 14.sp),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(result: false),
          child: Text(
            'Cancel',
            style: TextStyle(fontSize: 15.sp, color: Colors.black),
          ),
        ),
        SizedBox(width: 8.w),
        FilledButton(
          onPressed: () => Get.back(result: true),
          style: FilledButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12).r,
          ),
          child: Text(
            'Exit',
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.end,
      contentPadding: EdgeInsets.all(24).r,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12).r),
    ),
    barrierDismissible: false,
  );
  return confirmExit ?? false;
}
