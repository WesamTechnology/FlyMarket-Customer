import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/controller/home/categories_controller.dart';
import 'package:flymarket_customer/core/functions/translate_database.dart';
import 'package:flymarket_customer/link_api.dart';
import 'package:get/get.dart';

class HeaderSection extends StatelessWidget {


  const HeaderSection({
    super.key,
  });


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
        titlePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        title: Text(
          translateDatabase(controller.supermarketModel.supermarketNameAr!, controller.supermarketModel.supermarketName!),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        background: Image.network("${AppLink.imageSupermarket}/${controller.supermarketModel.supermarketImage!}", fit: BoxFit.cover)
      ),
    );
  }
}
