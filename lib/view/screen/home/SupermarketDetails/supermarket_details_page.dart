import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/controller/home/categories_controller.dart';
import 'package:flymarket_customer/core/functions/translate_database.dart';
import 'package:flymarket_customer/data/model/categories_model.dart';
import 'package:flymarket_customer/link_api.dart';
import 'package:get/get.dart';
import 'package:flymarket_customer/core/constant/routes.dart';

import '../../../widget/home/supermarket/header_section.dart';
import '../../../widget/home/supermarket/info_section.dart';

class SupermarketDetailsPage extends StatelessWidget {
  const SupermarketDetailsPage({super.key});

  int _calculateColumns(double width) {
    if (width >= 1100) return 5;
    if (width >= 900) return 4;
    if (width >= 600) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesControllerImp());
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(AppRoute.myCart),
        label: Text(translateDatabase("السلة", "Cart"), style: TextStyle(fontSize: 14.sp)),
        icon: Icon(Icons.shopping_cart_outlined, size: 20.sp),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            HeaderSection(),
            SliverToBoxAdapter(child: InfoSection()),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              sliver: SliverLayoutBuilder(
                builder: (context, constraints) {
                  final columns = _calculateColumns(
                    constraints.crossAxisExtent,
                  );

                  return GetBuilder<CategoriesControllerImp>(
                    builder: (controller) {
                      return SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          mainAxisSpacing: 12.h,
                          crossAxisSpacing: 12.w,
                          childAspectRatio: 0.85,
                        ),
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return CategoriesSuper(
                            i: index,
                            categoriesModel: CategoriesModel.fromJson(
                              controller.categories[index],
                            ),
                          );
                        }, childCount: controller.categories.length),
                      );
                    },
                  );
                },
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          ],
        ),
      ),
    );
  }
}

class CategoriesSuper extends GetView<CategoriesControllerImp> {
  const CategoriesSuper({
    super.key,
    required this.categoriesModel,
    required this.i,
  });

  final CategoriesModel categoriesModel;

  final int? i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
          controller.categories,
          i!,
          categoriesModel.categoriesId.toString(),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEFF8F1),
          borderRadius: BorderRadius.circular(20).r,
          border: Border.all(color: const Color(0xFF9DE09C), width: 1.2.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0).r,
                child: Image.network(
                  "${AppLink.imageCategories}/${categoriesModel.categoriesImage!}",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12).r,
              child: Text(
                translateDatabase(categoriesModel.categoriesNameAr!, categoriesModel.categoriesName!)
                ,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
