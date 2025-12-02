import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/imgaeasset.dart';
import 'package:flymarket_customer/core/constant/routes.dart';
import 'package:flymarket_customer/view/screen/auth/language.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart'; // تأكد من استبدال هذا بالمسار الصحيح لـ HomePage

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(const Duration(seconds: 7), () => Get.offNamed(AppRoute.language));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // يمكنك تغيير لون الخلفية
      body: Center(
        child: Lottie.asset(
          AppImageAsset.flyMarketSplash,

          onLoaded: (composition) {
            Future.delayed(composition.duration, () {
              Get.offNamed(AppRoute.language);
            });
          },
        ),
      ),

      //Center(child: Lottie.asset(AppImageAsset.splash3,width: 200.w,height: 200.h)),
    );
  }
}
