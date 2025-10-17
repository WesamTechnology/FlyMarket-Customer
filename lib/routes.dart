import 'package:flutter/material.dart';
import 'package:flymarket_customer/core/constant/routes.dart';
import 'package:flymarket_customer/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:flymarket_customer/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:flymarket_customer/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:flymarket_customer/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:flymarket_customer/view/screen/auth/login.dart';
import 'package:flymarket_customer/view/screen/auth/signup.dart';
import 'package:flymarket_customer/view/screen/auth/splash.dart';
import 'package:flymarket_customer/view/screen/auth/success_signup.dart';
import 'package:flymarket_customer/view/screen/auth/verifycodesignup.dart';
import 'package:flymarket_customer/view/screen/home/home_page.dart';
import 'package:flymarket_customer/view/screen/onboarding/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes ={
  AppRoute.splash : (context) => const SplashScreen(),
  AppRoute.login :  (context)=> Login(),
  AppRoute.signUp :  (context)=> SignUp(),
  AppRoute.forgetPassword :  (context)=> ForgetPassword(),
  AppRoute.verfiyCode :  (context)=> VerifyCode(),
  AppRoute.resetPassword :  (context)=> ResetPassword(),
  AppRoute.verfiyCodeSignUp :  (context)=> VerifCodeSignup(),
  AppRoute.successResetpassword :  (context)=> SuccessResetpassword(),
  AppRoute.successSignUp :  (context)=> SuccessSignup(),

  //Onboarding
  AppRoute.onboarding : (context) => const Onboarding(),

  //Home
  AppRoute.homepage : (context) => const HomePage(),
};