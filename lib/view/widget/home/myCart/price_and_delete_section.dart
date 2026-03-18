import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/functions/translate_database.dart';


class PriceAndDeleteSection extends StatelessWidget {
  const PriceAndDeleteSection({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.close, color: AppColor.grey),
        // ),
        Text(""),
        SizedBox(height: 23.h,),
        Padding(
          padding:  EdgeInsets.only(left: Get.locale!.languageCode == "ar" ? 10.w : 0, right: Get.locale!.languageCode == "ar" ?0 : 10.w),
          child: Text(
            translateDatabase("$price ريال", "$price RYE"),
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
