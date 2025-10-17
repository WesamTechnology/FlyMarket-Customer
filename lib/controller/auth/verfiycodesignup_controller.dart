
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class VerfiyCodeSignupController extends GetxController{
  checkCode();
  goToSuccessSignUp();
}

class VerfiyCodeSignupControllerImp extends VerfiyCodeSignupController{
  late String code;

  @override
  goToSuccessSignUp() {
    Get.toNamed(AppRoute.successSignUp);
  }

  @override
  checkCode() {
  }

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void dispose() {


    super.dispose();
  }

}