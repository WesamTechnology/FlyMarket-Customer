
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../controller/auth/forgetpassword_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller = Get.put(
      ForgetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("14".tr, style: TextStyle(color: AppColor.grey)),
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.h),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              SizedBox(height: 40.h),

              Customtexttitleauth(text: "27".tr),
              SizedBox(height: 17.h),
              Customtextbodyauth(text: "29".tr),
              SizedBox(height: 25.h),
              CustomTextFormAuth(
                val: (val) {
                  return validInput(val!, 5, 100, "phone");
                },
                hintTextl: "22".tr,
                labelTextl: "21".tr,
                icon: Icons.phone_android,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 17.h),
              Custombuttonauth(
                text: "30".tr,
                onTap: () {
                  controller.checkemail();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
