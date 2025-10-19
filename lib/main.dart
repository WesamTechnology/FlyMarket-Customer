import 'package:flutter/material.dart';
import 'package:flymarket_customer/routes.dart';
import 'package:flymarket_customer/view/screen/auth/splash.dart';
import 'package:flymarket_customer/view/screen/home/home_page.dart';
import 'package:get/get.dart';

import 'binding.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      translations: MyTranslation(),
      initialBinding: MyBinding(),
      theme: controller.themeData,
      getPages: routes,

    );
  }
}
