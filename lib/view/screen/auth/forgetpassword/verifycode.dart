
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../controller/auth/verfiycode_controller.dart';
import '../../../../controller/auth/verfiycodesignup_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerfiyCodeControllerImp controller = Get.put(VerfiyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification Code", style: TextStyle(color: AppColor.grey)),
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25).r,
        child: ListView(
          children: [
            SizedBox(height: 40.h),

            Customtexttitleauth(text: "Check Code",),

            SizedBox(height: 25.h),
            OtpTextField(
              fieldWidth: 52.w,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode){
                controller.goToResetPasswrd();
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
