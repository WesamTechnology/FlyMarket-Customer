
import 'package:flutter/material.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              SizedBox(height: 50),

              Customtexttitleauth(text: "27".tr),
              SizedBox(height: 20),
              Customtextbodyauth(text: "29".tr),
              SizedBox(height: 30),
              CustomTextFormAuth(
                val: (val) {
                  return validInput(val!, 5, 100, "email");
                },
                hintTextl: "12".tr,
                labelTextl: "18".tr,
                icon: Icons.email_outlined,
              ),
              SizedBox(height: 20),
              Custombuttonauth(
                text: "30".tr,
                onTap: () {
                  controller.checkemail();
                  controller.goToVerifyCode();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
