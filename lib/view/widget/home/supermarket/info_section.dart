import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/view/widget/home/categories/custom_Search.dart';
import 'package:get/get.dart';

import '../../../../controller/home/categories_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/translate_database.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CategoriesControllerImp controller = Get.put(CategoriesControllerImp());
    return Container(
      color: const Color(0xFFF6F7FB),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // 🏪 اسم المتجر
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Icon(
                      Icons.storefront,
                      size: 18.sp,
                      color: AppColor.primaryColor,
                    ),
                    SizedBox(width: 6.w),

                    Expanded(
                      child: Text(
                        translateDatabase(
                          controller.supermarketModel.supermarketNameAr ?? "",
                          controller.supermarketModel.supermarketName ?? "",
                        ),
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10.w),

              // 📍 الموقع
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 16.sp,
                    ),
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
              ),
            ],
          ),
          SizedBox(height: 15.h),
         // const CustomSearch(),
          SizedBox(height: 15.h),

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
    );
  }
}
