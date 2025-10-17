
import 'package:flutter/material.dart';
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
        style: TextStyle(color: Colors.white,fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        padding: EdgeInsets.symmetric(
          horizontal: 100,
          vertical: 15,
        ),
      ),
    );
  }
}
