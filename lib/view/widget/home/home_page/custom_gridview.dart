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
        childAspectRatio: 0.78.h, // يتحكم بنسبة الطول إلى العرض
      ),
      itemCount: controller.supermarket.length, // عدد العناصر
      padding: const EdgeInsets.all(5).r,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0xffe7fae7),
            borderRadius: BorderRadius
                .circular(15)
                .r,
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
    var market = controller.supermarket[i!];

    /// 🔥 تحويل المسافة
    double distanceKm = ((market['distance'] ?? 0) / 1000);

    return InkWell(
      borderRadius: BorderRadius.circular(18.r),
      onTap: () {
        controller.goToCategories(
          controller.supermarket,
          i!,
          supermarketModel.supermarketId.toString(),
          supermarketModel,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [

            /// 🖼️ الصورة + Overlay
            Expanded(
              child: Stack(
                children: [

                  /// الصورة
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(18.r),
                    ),
                    child: _buildImage(),
                  ),

                  /// Gradient احترافي
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(18.r),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.4),
                        ],
                      ),
                    ),
                  ),

                  /// 🔥 Badge (الأقرب)
                  if (i == 0)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          "الأقرب",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  /// 📍 المسافة
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.location_on,
                              color: Colors.white, size: 14.sp),
                          SizedBox(width: 4.w),
                          Text(
                            "${distanceKm.toStringAsFixed(1)} كم",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// 🏪 الاسم + حالة
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Column(
                children: [
                  Text(
                    translateDatabase(
                      '${supermarketModel.supermarketNameAr}',
                      '${supermarketModel.supermarketName}',
                    ),
                    style: TextStyle(
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    if ("${supermarketModel.supermarketImage}" != "default.png" &&
        "${supermarketModel.supermarketImage}" != "empty" &&
        "${supermarketModel.supermarketImage}" != "null") {
      return Image.network(
        "${AppLink.imageSupermarket}/${supermarketModel.supermarketImage}",
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          AppImageAsset.splash2,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Image.asset(
        AppImageAsset.splash2,
        fit: BoxFit.cover,
      );
    }
  }
}