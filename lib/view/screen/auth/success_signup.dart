
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../widget/auth/custombuttonauth.dart';



class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("32".tr, style: TextStyle(color: AppColor.grey)),
          backgroundColor: AppColor.backgroundcolor,
          centerTitle: true,
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(vertical: 18,horizontal: 25).r,
          child: Column(

              children: [
                Center(child: Icon(Icons.check_circle_outline,color: AppColor.primaryColor,size: 180.r,)),
                SizedBox(height: 20.h,),
                Text("38".tr,style: TextStyle(color: AppColor.fourthColor,fontSize: 17.5.sp),),
                Spacer(),
                Custombuttonauth(text: "31".tr,onTap: (){Get.offAllNamed(AppRoute.login);},),
                SizedBox(height: 40.h,),
              ]
          ),
        )
    );
  }
}
