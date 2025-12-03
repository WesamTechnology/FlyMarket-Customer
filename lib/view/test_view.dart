
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controller/test_controller.dart';
import '../core/class/statuserequest.dart';
import '../core/constant/color.dart';
import '../core/constant/imgaeasset.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: GetBuilder<TestController>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loding) {
            return Center(
              child: Lottie.asset(
                AppImageAsset.mm,
                width: 400,
                delegates: LottieDelegates(
                  values: [

                    ValueDelegate.color(
                      const [
                        '**',
                      ],
                      value: AppColor.primaryColor,
                    ),
                  ],
                ),
              ),
            );
          } else if (controller.statusRequest == StatusRequest.offlinefailure) {
            return Center(child: Lottie.asset(AppImageAsset.offline));
          } else if (controller.statusRequest == StatusRequest.serverfailure) {
            return Center(child: Text("serverfailure"));
          } else {
            return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Center(child: Text("${controller.data}"));
              },
            );
          }
        },
      ),
    );
  }
}
