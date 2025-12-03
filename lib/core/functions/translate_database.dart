
import 'package:get/get.dart';

import '../services/services.dart';

translateDatabase(columAr,columEn){
  MyServices myServices = Get.find();

  if(myServices.sharedPreferences.getString("lang")=="ar"){
    return columAr;
  }else{
    return columEn;
  }
}