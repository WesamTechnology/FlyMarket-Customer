import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/color.dart';
import 'package:flymarket_customer/view/widget/home/myCart/price_and_delete_section.dart';
import 'package:flymarket_customer/view/widget/home/myCart/product_info_widget.dart';

import '../../../../core/constant/imgaeasset.dart';


class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h,top: 8.h,right: 10.w,left: 10.w),
      child: Column(
        children: [

          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20.r),
              side: BorderSide(color: Colors.white)
            ),
            shadowColor: Colors.white,
            margin: EdgeInsets.only(top: 10.h),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                children: [
                  SizedBox(width: 10.w,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      AppImageAsset.pepper_red,
                      width: 70.w,
                      height: 70.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                      flex: 2,
                      child: Productinfowidget()
                  ),
                  Expanded(
                    child: PriceAndDeleteSection(),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Colors.grey[300],),
        ],
      ),
    );
  }
}
