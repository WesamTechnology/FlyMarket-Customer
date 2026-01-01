
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/class/handlingdataview.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
    final SignupController controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(
        title: Text("17".tr, style: TextStyle(color: AppColor.grey)),
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
      ),
      body: Obx((){
        if(!controller.isCodeSent.value){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  SizedBox(height: 35.h),

                  Customtexttitleauth(text: "10".tr,),
                  SizedBox(height: 17.h),
                  Customtextbodyauth(text: "11".tr,),
                  SizedBox(height: 25.h),
                  CustomTextFormAuth(
                    controller: controller.nameController,
                    val: (val){
                      return  validInput(val!, 5, 100, "username");
                    },
                    hintTextl: "23".tr,
                    labelTextl: "20".tr,
                    icon: Icons.person_outline,
                  ),
                  SizedBox(height: 20.h,),
                  IntlPhoneField(
                    controller: controller.otpController,
                    decoration: const InputDecoration(
                      labelText: 'رقم الهاتف',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                    ),
                    initialCountryCode: 'YE',
                    languageCode: 'ar',
                    onChanged: (phone) {
                      controller.phoneNumber.value = phone.completeNumber;
                    },
                  ),

                  SizedBox(height: 30.h),

                  if (controller.isLoading.value)
                    Center(child: const CircularProgressIndicator())
                  else
                    Custombuttonauth(text: "17".tr,onTap: (){
                      controller.sendCode(controller.phoneNumber.value);
                    },),
                  SizedBox(height: 40.h),
                  TextSignUpOrSignIn(textOne: "25".tr,textTow:"9".tr ,onPressed: (){
                    controller.goToLogin();},)
                ],
              ),
            ),
          );
        }  else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
            child: Column(
              children: [
                Text(
                  'تم إرسال الكود إلى ${controller.phoneNumber.value}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),

                OtpTextField(
                  numberOfFields: 6, // نفس maxLength
                  fieldWidth: 52, // إذا ما تستخدم ScreenUtil
                  borderRadius: BorderRadius.circular(20),
                  borderColor: const Color(0xFF512DA8),
                  showFieldAsBox: true,
                  textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                  onCodeChanged: (String code) {
                  },
                  onSubmit: (String verificationCode) {
                    controller.otpController.text = verificationCode;
                  },
                ),

                const SizedBox(height: 24),

                if (controller.isLoading.value)
                  const CircularProgressIndicator()
                else
                  Custombuttonauth(
                    text: "تحقق وإنشاء الحساب",
                    onTap: () {
                      controller.verifyAndRegister();
                    },
                  ),
                TextButton(
                  onPressed: () {
                    controller.isCodeSent.value = false;
                  },
                  child: const Text("تعديل البيانات"),
                ),
              ],
            ),
          );
        }
      })
    );
  }
}
