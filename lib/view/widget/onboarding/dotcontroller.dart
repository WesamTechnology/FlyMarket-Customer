
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class DotcontrollerOnboarding extends StatelessWidget {
  const DotcontrollerOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OnboardingControllerImp>(builder: (controller)=> Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          onBoardingList.length,
              (index) => AnimatedContainer(
            margin: EdgeInsets.only(right: 5).r,
            duration:Duration(milliseconds: 900),
            width: controller.currentPage == index? 15:6 ,
            height: 6.h,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
      ],
    ));
  }
}
