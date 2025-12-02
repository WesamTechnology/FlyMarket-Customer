
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/imgaeasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 130.w,
      height: 130.h,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,

        image: DecorationImage(
          image: AssetImage(AppImageAsset.splash2),
          fit: BoxFit.scaleDown,
        ),
      ),
    );

  }
}
