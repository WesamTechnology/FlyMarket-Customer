
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/apptheme.dart';
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


  @override
  void onInit() {

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