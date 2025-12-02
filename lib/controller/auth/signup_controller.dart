
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SignUpController extends GetxController{
  signUp();
  goToLogin();
}

class SignUpControllerImp extends SignUpController{
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  signUp() {
    var formDate = formState.currentState;
    if(formDate!.validate()){
      print("is valid");
      Get.offNamed(AppRoute.verfiyCodeSignUp);
    }
    else{
      print("is note valid");


  }
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

}