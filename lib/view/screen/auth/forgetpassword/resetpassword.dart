
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../controller/auth/resetpassword_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("ResetPassword", style: TextStyle(color: AppColor.grey)),
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              SizedBox(height: 40.h),

              Customtexttitleauth(text: "34".tr,),
              SizedBox(height: 35.h),
              CustomTextFormAuth(
                val: (val){
                  return  validInput(val!, 5, 100, "password");
                },
                hintTextl: "Enter your new password",
                labelTextl: "19".tr,
                icon: Icons.remove_red_eye_outlined,
              ),
              SizedBox(height: 30),
              CustomTextFormAuth(
                val: (val){
                  return  validInput(val!, 5, 100, "password");
                },
                hintTextl: "Enter Repassword".tr,
                labelTextl: "19".tr,
                icon: Icons.remove_red_eye_outlined,
              ),
              SizedBox(height: 40.h),
              Custombuttonauth(text: "33".tr,onTap: (){
                controller.checkPassword();
                //controller.goToSuccessResetPassword();
              },),
            ],
          ),
        ),
      ),
    );
  }
}
