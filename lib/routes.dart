import 'package:flutter/material.dart';
import 'package:flymarket_customer/core/constant/routes.dart';
import 'package:flymarket_customer/core/middleware/mymiddleware.dart';
import 'package:flymarket_customer/view/screen/address/add_address.dart';
import 'package:flymarket_customer/view/screen/address/add_part_two_address.dart';
import 'package:flymarket_customer/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:flymarket_customer/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:flymarket_customer/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:flymarket_customer/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:flymarket_customer/view/screen/auth/language.dart';
import 'package:flymarket_customer/view/screen/auth/login.dart';
import 'package:flymarket_customer/view/screen/auth/signup.dart';
import 'package:flymarket_customer/view/screen/auth/splash.dart';
import 'package:flymarket_customer/view/screen/auth/success_signup.dart';
import 'package:flymarket_customer/view/screen/auth/verifycodesignup.dart';
import 'package:flymarket_customer/view/screen/home/SupermarketDetails/supermarket_details_page.dart';
import 'package:flymarket_customer/view/screen/home/categories.dart';
import 'package:flymarket_customer/view/screen/home/favorites.dart';
import 'package:flymarket_customer/view/screen/home/home_page.dart';
import 'package:flymarket_customer/view/screen/home/items/items.dart';
import 'package:flymarket_customer/view/screen/home/items/itemsDetails/items_details.dart';
import 'package:flymarket_customer/view/screen/home/items/items_all.dart';
import 'package:flymarket_customer/view/screen/home/my_cart.dart';
import 'package:flymarket_customer/view/screen/home/setting_page.dart';
import 'package:flymarket_customer/view/screen/home/shop.dart';
import 'package:flymarket_customer/view/screen/onboarding/onboarding.dart';
import 'package:get/get.dart';


List<GetPage<dynamic>> routes = [
  GetPage(name: "/", page: () => const SplashScreen()),
  GetPage(name: AppRoute.language, page: () => Language(appRoute: AppRoute.onboarding,),middlewares: [Mymiddleware()]),
  GetPage(name: AppRoute.login, page: () => Login()),
  GetPage(name: AppRoute.signUp, page: () => SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => ResetPassword()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => VerifCodeSignup()),
  //GetPage(name: AppRoute.successResetpassword, page: () => SuccessResetpassword()),
  GetPage(name: AppRoute.successSignUp, page: () => SuccessSignup()),

  // Onboarding
  GetPage(name: AppRoute.onboarding, page: () => const Onboarding()),

  // Home
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
  GetPage(name: AppRoute.shope, page: () => const Shop()),
  GetPage(name: AppRoute.supermarketDetailsPage, page: () => const SupermarketDetailsPage()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.itemsDetails, page: () => const ItemsDetails()),
  GetPage(name: AppRoute.itemsAll, page: () => const ItemsAll()),
  GetPage(name: AppRoute.categories, page: () => const Categories()),
  GetPage(name: AppRoute.myCart, page: () => const MyCart()),
  GetPage(name: AppRoute.myFavroite, page: () => const Favorites()),
  GetPage(name: AppRoute.setting, page: () => const SettingPage()),
  GetPage(name: AppRoute.addressadd, page: () => const AddAddress()),
  GetPage(name: AppRoute.addressadddetails, page: () => const AddPartTwoAddress()),
];