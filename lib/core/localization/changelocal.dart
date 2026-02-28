
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../constant/apptheme.dart';
import '../functions/fcmconfig.dart';
import '../services/services.dart';

class LocaleController extends GetxController{

  Locale? language;
  ThemeData themeData = themeEnglish;
  MyServices myServices = Get.find();

  changeLang(String langCode){
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    Get.changeTheme(themeData);
    Get.updateLocale(locale);
  }

  determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبية", "الرجاء تشغيل الموقع");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبية", "الرجاء منح صلاحسة الموقع لتطبيق");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("تنبية", "الرجاء لايكمنك استخدام التطبيق طالما لم تقم بنح صلاحية الموقع");
    }
  }

  @override
  void onInit() {
    myServices.sharedPreferences.setString("id", "14"); // ملاحضه هاذا خطأ ينحذف سويته لتجربة
    requestPermissionNotification();
    fcmconfig();
    determinePosition();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");

    if(sharedPrefLang =="ar"){
      language = const Locale("ar");
      themeData = themeArbic;
    }else if(sharedPrefLang =="en"){
      language = const Locale("en");
      themeData=themeEnglish;
    }else{
      language = Locale(Get.deviceLocale!.languageCode);
      themeData=themeEnglish;
    }

    super.onInit();
  }

}