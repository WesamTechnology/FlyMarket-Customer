import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/color.dart';
import 'package:flymarket_customer/view/widget/home/myCart/price_and_delete_section.dart';
import 'package:flymarket_customer/view/widget/home/myCart/product_info_widget.dart';

import '../../../../core/constant/imgaeasset.dart';
import '../../../../link_api.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.count,
    required this.add,
    required this.delete,
  });

  final String image;
  final String name;
  final String description;
  final String price;
  final String count;
  final void Function() add;
  final void Function() delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, top: 8.h, right: 10.w, left: 10.w),
      child: Column(
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20.r),
              side: BorderSide(color: Colors.white),
            ),
            shadowColor: Colors.white,
            margin: EdgeInsets.only(top: 10.h),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                children: [
                  SizedBox(width: 10.w),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      "${AppLink.imageItems}/${image}",
                      width: 70.w,
                      height: 70.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    flex: 2,
                    child: Productinfowidget(
                      name: name,
                      description: description,
                      count: count,
                      add: add,
                      delete: delete,
                    ),
                  ),
                  Expanded(child: PriceAndDeleteSection(price: price)),
                ],
              ),
            ),
          ),
          Divider(color: Colors.grey[300]),
        ],
      ),
    );
  }
}
