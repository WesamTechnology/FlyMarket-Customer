import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/routes.dart';
import 'package:flymarket_customer/routes.dart';
import 'package:get/get.dart';

import 'binding.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (context , child) {
          return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: controller.language,
        translations: MyTranslation(),
        initialBinding: MyBinding(),
        theme: controller.themeData,
        initialRoute: AppRoute.splash,
        getPages: routes,
      ); }
    );
  }
}
