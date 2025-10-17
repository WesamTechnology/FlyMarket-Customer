
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("17".tr, style: TextStyle(color: AppColor.grey)),
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

              Customtexttitleauth(text: "10".tr,),
              SizedBox(height: 20),
              Customtextbodyauth(text: "11".tr,),
              SizedBox(height: 30),
              CustomTextFormAuth(
                val: (val){
                  return  validInput(val!, 5, 100, "username");
                },
                hintTextl: "23".tr,
                labelTextl: "20".tr,
                icon: Icons.person_outline,
              ),
              SizedBox(height: 30),
              CustomTextFormAuth(
                val: (val){
                  return  validInput(val!, 5, 100, "email");
                },
                hintTextl: "12".tr,
                labelTextl: "18".tr,
                icon: Icons.email_outlined,
              ),
              SizedBox(height: 30),
              CustomTextFormAuth(
                val: (val){
                  return  validInput(val!, 5, 100, "phone");
                },
                hintTextl: "22".tr,
                labelTextl: "21".tr,
                icon: Icons.phone_android,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 30),
              CustomTextFormAuth(
                val: (val){
                  return  validInput(val!, 5, 100, "password");
                },
                hintTextl: "13".tr,
                labelTextl: "19".tr,
                icon: Icons.remove_red_eye_outlined,
              ),


              SizedBox(height: 40),
              Custombuttonauth(text: "17".tr,onTap: (){
                controller.signUp();
              },),
              SizedBox(height: 50),
              TextSignUpOrSignIn(textOne: "25".tr,textTow:"9".tr ,onPressed: (){
                controller.signUp();
                controller.goToLogin();},)
            ],
          ),
        ),
      ),
    );
  }
}
