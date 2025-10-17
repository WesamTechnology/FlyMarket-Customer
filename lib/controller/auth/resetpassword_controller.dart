

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class ResetPasswordController extends GetxController{
  checkPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController{
  late TextEditingController password;
  late TextEditingController repassword;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  goToSuccessResetPassword() {
    Get.toNamed(AppRoute.successResetpassword);
  }

  @override
  checkPassword() {
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

    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {

    password.dispose();
    repassword.dispose();
    super.dispose();
  }

}