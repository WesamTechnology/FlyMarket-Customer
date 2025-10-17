import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../data/datasource/static/static.dart';


class CustomSliderOnboarding extends GetView {
   CustomSliderOnboarding({super.key});
   OnboardingControllerImp controller = Get.put(OnboardingControllerImp());
  @override
  Widget build(BuildContext context) {
    return  PageView.builder(
      controller:controller.pageController ,
      onPageChanged: (value){
        controller. onChangPage(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder:
          (context, i) => Column(
        children: [
          Text(
            onBoardingList[i].title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 80),
          Image(image: AssetImage(onBoardingList[i].image),width: 220,height: 230,),
          SizedBox(height: 80),
          Text(
            onBoardingList[i].subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
