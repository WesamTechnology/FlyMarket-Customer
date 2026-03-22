import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/color.dart';
import 'package:flymarket_customer/core/functions/translate_database.dart';
import 'package:get/get.dart';
Future<bool> alertExitApp() async {
  bool? confirmExit = await Get.dialog<bool>(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// 🔴 أيقونة
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.exit_to_app,
                color: AppColor.primaryColor,
                size: 28.sp,
              ),
            ),

            SizedBox(height: 15.h),

            /// 📌 العنوان
            Text(
              translateDatabase("الخروج من التطبيق", "Exit App"),
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 10.h),

            /// 📝 الوصف
            Text(
              translateDatabase(
                "هل أنت متأكد أنك تريد الخروج من التطبيق؟",
                "Are you sure you want to exit the app?",
              ),
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20.h),

            /// 🔘 الأزرار
            Row(
              children: [
                /// إلغاء
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(result: false),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      translateDatabase("إلغاء", "Cancel"),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10.w),

                /// خروج
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(result: true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      translateDatabase("خروج", "Exit"),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );

  return confirmExit ?? false;
}