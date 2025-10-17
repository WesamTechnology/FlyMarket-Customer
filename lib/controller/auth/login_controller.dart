

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUP();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController{
  late TextEditingController email;
 late TextEditingController password;

 GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  goToSignUP() {
    Get.offAllNamed(AppRoute.signUp);
  }

  @override
  login() {
    var formdate = formState.currentState;
    if(formdate!.validate()){
      print("is valid");
    }
    else{
      print("is note valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

}