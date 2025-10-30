
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController{
  checkemail();
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{
  late TextEditingController email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  goToVerifyCode() {
    Get.toNamed(AppRoute.verfiyCode);
  }

  @override
  checkemail() {
    var formdate = formState.currentState;
    if(formdate!.validate()){
      Get.toNamed(AppRoute.verfiyCode);
    }
    else{
      print("is note valid");
    }
  }

  @override
  void onInit() {

    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {

    email.dispose();
    super.dispose();
  }

}