
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';



class CustomButtonOnboarding extends GetView {
   CustomButtonOnboarding({super.key});
  OnboardingControllerImp controller = Get.put(OnboardingControllerImp());
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: () {
        controller.next();
      },
      child: Text(
        "8".tr,
        style: TextStyle(color: Colors.white,fontSize: 18.sp),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        padding: EdgeInsets.symmetric(
          horizontal: 90.w,
          vertical: 10.h,
        ),
      ),
    );
  }
}
