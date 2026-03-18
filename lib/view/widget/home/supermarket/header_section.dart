import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/controller/home/categories_controller.dart';
import 'package:flymarket_customer/core/constant/color.dart';
import 'package:flymarket_customer/core/functions/translate_database.dart';
import 'package:flymarket_customer/link_api.dart';
import 'package:get/get.dart';

import '../../../../core/constant/imgaeasset.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  bool _isNetworkImage(String path) {
    return path.startsWith('http') || path.startsWith('https');
  }

  @override
  Widget build(BuildContext context) {
    CategoriesControllerImp controller = Get.put(CategoriesControllerImp());

    return SliverAppBar(
      pinned: true,
      expandedHeight: 240.h,
      backgroundColor: Colors.white,
      elevation: 1,
      foregroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
        title: Container(

          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                Colors.green.withOpacity(0.7),
                Colors.green.withOpacity(0.2),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Text(
            translateDatabase(
              controller.supermarketModel.supermarketNameAr!,
              controller.supermarketModel.supermarketName!,
            ),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.9),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        background: "${controller.supermarketModel
            .supermarketImage}" != "default.png" && "${controller.supermarketModel
            .supermarketImage}" != "empty" && "${controller.supermarketModel
            .supermarketImage}" != "null"   ? Image.network(
            "${AppLink.imageSupermarket}/${controller.supermarketModel
                .supermarketImage}",
            fit: BoxFit.fill,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              AppImageAsset.splash2,
              fit: BoxFit.fill,
              width: double.infinity,
            )

        ) :Image.asset(
          "assets/images/splash2.png",
          fit: BoxFit.fill,
          width: double.infinity,

        ),
      ),
    );
  }
}
