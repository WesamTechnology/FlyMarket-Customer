import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/bindings/intialbinfing.dart';
import 'package:flymarket_customer/core/constant/routes.dart';
import 'package:flymarket_customer/routes.dart';
import 'package:get/get.dart';


import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(
    firebaseMessagingBackgroundHandler,
  );
  await dotenv.load(fileName: ".env");
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
        initialBinding: Intialbinfing(),
        theme: controller.themeData,
        initialRoute: AppRoute.homepage,
        getPages: routes,
      ); }
    );
  }
}
