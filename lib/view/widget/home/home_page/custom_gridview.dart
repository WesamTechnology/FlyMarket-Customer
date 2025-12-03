import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/controller/home/home_shop_controller.dart';
import 'package:flymarket_customer/core/constant/imgaeasset.dart';
import 'package:flymarket_customer/core/functions/translate_database.dart';
import 'package:flymarket_customer/data/model/supermarket_model.dart';
import 'package:flymarket_customer/link_api.dart';
import 'package:get/get.dart';

class CustomGridview extends GetView<HomeShopControllerImp> {
  const CustomGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        crossAxisSpacing: 9.w,
        mainAxisSpacing: 9.h,
        childAspectRatio: 0.7.h, // يتحكم بنسبة الطول إلى العرض
      ),
      itemCount: controller.supermarket.length, // عدد العناصر
      padding: const EdgeInsets.all(5).r,
      itemBuilder: (context, index) {
        print(
          "============ Length = ${controller.supermarket.length}=========================",
        );
        return Container(
          decoration: BoxDecoration(
            color: Color(0xffe7fae7),
            borderRadius: BorderRadius.circular(15).r,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 4,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Supermarket(
            i: index,
            supermarketModel: SupermarketModel.fromJson(
              controller.supermarket[index],
            ),
          ),
        );
      },
    );
  }
}

class Supermarket extends GetView<HomeShopControllerImp> {
  const Supermarket({
    super.key,
    required this.supermarketModel,
    required this.i,
  });

  final SupermarketModel supermarketModel;
  final int? i;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToCategories(
          controller.supermarket,
          i!,
          supermarketModel.supermarketId.toString(),
          supermarketModel,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(13).r),
              child: Image.network(
                "${AppLink.imageSupermarket}/${supermarketModel.supermarketImage}",
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(7.0).r,
            child: Text(
              translateDatabase('${supermarketModel.supermarketNameAr}', '${supermarketModel.supermarketName}')
              ,
              style: TextStyle(
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
