import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/view/widget/home/categories/custom_Search.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

import '../../../../controller/home/categories_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/translate_database.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesControllerImp controller = Get.put(CategoriesControllerImp());
    String name = translateDatabase(
      controller.supermarketModel.supermarketNameAr ?? "",
      controller.supermarketModel.supermarketName ?? "",
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 الصف العلوي
          Row(
            children: [
              /// 🏪 اسم المتجر + الوقت
              Expanded(
                flex: 2,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// اسم المتجر
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.storefront,
                            size: 18.sp,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        SizedBox(width: 8.w),

                        Expanded(
                          child: name.length > 15
                              ? SizedBox(
                            height: 22.h,
                            child: Marquee(
                              text: name,
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              velocity: 30,
                              blankSpace: 40,
                            ),
                          )
                              : Text(
                            name,
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8.h),

                    /// ⏰ وقت العمل
                    Row(
                      children: [
                        Icon(Icons.access_time,
                            size: 14.sp, color: Colors.grey),
                        SizedBox(width: 5.w),
                        Text(
                          controller.supermarketModel.supermarketTimeOpen ?? "",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10.w),

              /// 📍 الموقع + زر الخريطة
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    /// الموقع
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.location_on,
                            color: Colors.red, size: 16.sp),
                        SizedBox(width: 4.w),
                        Flexible(
                          child: Text(
                            controller.supermarketModel.supermarketLocation ?? "",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey[600],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12.h),

                    /// زر الخريطة (احترافي)
                    GestureDetector(
                      onTap: () {
                        controller.openMap();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColor.primaryColor,
                              AppColor.primaryColor.withOpacity(0.8),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.primaryColor.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.map,
                                color: Colors.white, size: 16),
                            SizedBox(width: 6),
                            Text(
                              translateDatabase("الخريطة", "Map"),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 18.h),

          /// 🔹 عنوان المنتجات
          Row(

            children: [
              Container(
                width: 4,
                height: 18,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                translateDatabase("المنتجات المتاحة", "Available Products"),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
