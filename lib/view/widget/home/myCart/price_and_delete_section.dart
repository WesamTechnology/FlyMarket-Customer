import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/color.dart';


class PriceAndDeleteSection extends StatelessWidget {
  const PriceAndDeleteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.close, color: AppColor.grey),
        ),
        SizedBox(height: 23.h,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            r"$4.99",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
