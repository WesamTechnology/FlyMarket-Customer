
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class VerfiyCodeController extends GetxController{
  checkCode();
  goToResetPasswrd();
}

class VerfiyCodeControllerImp extends VerfiyCodeController{
  late String code;

  @override
  goToResetPasswrd() {
    Get.toNamed(AppRoute.resetPassword);
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