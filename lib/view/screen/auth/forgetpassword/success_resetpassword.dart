import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../widget/auth/custombuttonauth.dart';


class SuccessResetpassword extends StatelessWidget {
  const SuccessResetpassword({super.key});

  @override
  Widget build(BuildContext context) {
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
            Center(child: Icon(Icons.check_circle_outline,color: AppColor.primaryColor,size: 200,)),
            SizedBox(height: 25,),
            Text("36".tr,style: TextStyle(color: AppColor.fourthColor,fontSize: 20),),
            Spacer(),
            Custombuttonauth(text: "31".tr,onTap: (){},),
            SizedBox(height: 50,),
          ]
        ),
      )
    );
  }
}
