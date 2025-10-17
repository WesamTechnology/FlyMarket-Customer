
import 'package:flutter/material.dart';

import '../../../core/constant/imgaeasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 170,
      height: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,

        image: DecorationImage(
          image: AssetImage(AppImageAsset.splash),
          fit: BoxFit.scaleDown,
        ),
      ),
    );

  }
}
