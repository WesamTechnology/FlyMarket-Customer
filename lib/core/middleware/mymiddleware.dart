import 'package:flutter/material.dart';
import 'package:flymarket_customer/core/constant/routes.dart';
import 'package:flymarket_customer/core/services/services.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware {
  @override
  int? priority = 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("strep") == "2") {
      return RouteSettings(name: AppRoute.homepage);
    }
    if (myServices.sharedPreferences.getString("strep") == "1") {
      return RouteSettings(name: AppRoute.login);
    }
  }

}