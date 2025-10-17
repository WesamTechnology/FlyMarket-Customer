
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("9".tr, style: TextStyle(color: AppColor.grey)),
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: controller.formState,
            child: ListView(
              children: [
                SizedBox(height: 30),
                LogoAuth(),
                SizedBox(height: 20),
                Customtexttitleauth(text: "10".tr),
                SizedBox(height: 20),
                Customtextbodyauth(text: "11".tr),
                SizedBox(height: 30),
                CustomTextFormAuth(
                  val: (val) {
                    return validInput(val!, 5, 100, "email");
                  },
                  hintTextl: "12".tr,
                  labelTextl: "18".tr,
                  icon: Icons.email_outlined,
                ),
                SizedBox(height: 30),
                CustomTextFormAuth(
                  val: (val) {
                    return validInput(val!, 5, 30, "password");
                  },
                  hintTextl: "13".tr,
                  labelTextl: "19".tr,
                  icon: Icons.remove_red_eye_outlined,
                ),

                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    controller.goToForgetPassword();
                  },
                  child: Text(
                    "14".tr,
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(height: 20),
                Custombuttonauth(
                  text: "9".tr,
                  onTap: () {
                    controller.login();
                  },
                ),
                SizedBox(height: 50),
                TextSignUpOrSignIn(
                  textOne: "16".tr,
                  textTow: "17".tr,
                  onPressed: () {
                    controller.goToSignUP();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
