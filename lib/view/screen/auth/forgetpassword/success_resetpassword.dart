import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/signup_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/custombuttonauth.dart';


class SuccessResetpassword extends StatelessWidget {
  const SuccessResetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("32".tr, style: TextStyle(color: AppColor.grey)),
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
        child: Column(

          children: [
            Center(child: Icon(Icons.check_circle_outline,color: AppColor.primaryColor,size: 170.r,)),
            SizedBox(height: 25.h,),
            Text("36".tr,style: TextStyle(color: AppColor.fourthColor,fontSize: 17.sp),),
            Spacer(),
            Custombuttonauth(text: "31".tr,onTap: (){controller.goToLogin();},),
            SizedBox(height: 40.h,),
          ]
        ),
      )
    );
  }
}
