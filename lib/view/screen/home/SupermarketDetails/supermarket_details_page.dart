import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flymarket_customer/core/constant/routes.dart';

import '../../../../data/model/supermarket_model.dart';
import '../../../widget/home/supermarket/header_section.dart';
import '../../../widget/home/supermarket/info_section.dart';
import '../../../widget/home/supermarket/product_card.dart';

class SupermarketDetailsPage extends StatelessWidget {
  final String name;
  final String image;
  final String location;
  final double rating;
  final List<ProductModel> products;

  const SupermarketDetailsPage({
    super.key,
    required this.name,
    required this.image,
    required this.location,
    required this.rating,
    required this.products,
  });

  int _calculateColumns(double width) {
    if (width >= 1100) return 5;
    if (width >= 900) return 4;
    if (width >= 600) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(AppRoute.myCart),
        label: Text("Cart", style: TextStyle(fontSize: 14.sp)),
        icon: Icon(Icons.shopping_cart_outlined, size: 20.sp),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            HeaderSection(name: name, image: image),
            SliverToBoxAdapter(
              child: InfoSection(rating: rating, location: location),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              sliver: SliverLayoutBuilder(
                builder: (context, constraints) {
                  final columns = _calculateColumns(constraints.crossAxisExtent);
                  return SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 0.75,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final product = products[index];
                        return ProductCard(
                          product: product,
                          onAddToCart: () {},
                          onFavorite: () {},
                        );
                      },
                      childCount: products.length,
                    ),
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
