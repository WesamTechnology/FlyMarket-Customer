import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/class/handlingdataview.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: Text("9".tr, style: TextStyle(color: AppColor.grey)),
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;

          bool shouldExit = await alertExitApp();
          if (shouldExit) {
            SystemNavigator.pop(); // ✅ خروج فعلي من التطبيق
          }
        },
        child: Obx(() {
          if (!controller.isCodeSent.value) {
            return  Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    SizedBox(height: 20.h),
                    LogoAuth(),
                    SizedBox(height: 17.h),
                    Customtexttitleauth(text: "10".tr),
                    SizedBox(height: 17.h),
                    Customtextbodyauth(text: "11".tr),
                    SizedBox(height: 25.h),

                    IntlPhoneField(
                      decoration: const InputDecoration(
                        labelText: 'رقم الهاتف',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'YE',
                      languageCode: 'ar',
                      onChanged: (phone) {
                        controller.phoneNumber.value = phone.completeNumber;
                      },
                    ),

                    // CustomTextFormAuth(
                    //   val: (val) {
                    //     return validInput(val!, 5, 100, "phone");
                    //   },
                    //   hintTextl: "22".tr,
                    //   labelTextl: "21".tr,
                    //   icon: Icons.phone_android,
                    //   keyboardType: TextInputType.numberWithOptions(decimal: true),
                    // ),
                    // SizedBox(height: 25.h),
                    // CustomTextFormAuth(
                    //   val: (val) {
                    //     return validInput(val!, 5, 30, "password");
                    //   },
                    //   hintTextl: "13".tr,
                    //   labelTextl: "19".tr,
                    //   icon: Icons.remove_red_eye_outlined,
                    // ),
                    SizedBox(height: 17.h),

                    // InkWell(
                    //   onTap: () {
                    //     controller.goToForgetPassword();
                    //   },
                    //   child: Text(
                    //     "14".tr,
                    //     style: TextStyle(fontSize: 12.5.sp),
                    //     textAlign: TextAlign.end,
                    //   ),
                    //  ),
                    // SizedBox(height: 17.h),
                    if (controller.isLoading.value)
                      Center(child: const CircularProgressIndicator())
                    else
                      Custombuttonauth(
                        text: "9".tr,
                        onTap: () {
                          controller.sendCode(controller.phoneNumber.value);
                          //controller.login();
                        },
                      ),
                    SizedBox(height: 35.h),
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
            );
          } else {
            // إذا تم إرسال الكود، نعرض حقل إدخال الكود
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Text(
                    'تم إرسال الكود إلى ${controller.phoneNumber.value}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 24.h),
                  OtpTextField(
                    numberOfFields: 6,
                    // نفس maxLength
                    fieldWidth: 52,
                    // إذا ما تستخدم ScreenUtil
                    borderRadius: BorderRadius.circular(20),
                    borderColor: const Color(0xFF512DA8),
                    showFieldAsBox: true,
                    textStyle: const TextStyle(fontSize: 24),
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      controller.otpController.text = verificationCode;
                    },
                  ),

                  //   TextField(
                  // controller: controller.otpController,
                  // keyboardType: TextInputType.number,
                  // textAlign: TextAlign.center,
                  // maxLength: 6,
                  // style: const TextStyle(
                  // fontSize: 24,
                  // letterSpacing: 8,
                  // ),
                  // decoration: const InputDecoration(
                  // hintText: '000000',
                  // border: OutlineInputBorder(),
                  // ),
                  // ),
                  SizedBox(height: 24.h),
                  // زر التحقق
                  if (controller.isLoading.value)
                    const CircularProgressIndicator()
                  else
                    Custombuttonauth(
                      text: "تحقق والدخول",
                      onTap: () {
                        controller.verifyCode();
                      },
                    ),
                  // زر للرجوع وتعديل الرقم
                  TextButton(
                    onPressed: () {
                      controller.isCodeSent.value = false;
                    },
                    child: const Text("تعديل الرقم"),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
