

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  textTheme: TextTheme(
    headlineLarge:  TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
      color: AppColor.black,
    ),
    headlineMedium:  TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColor.black,
    ),
    bodyMedium:  TextStyle(
      fontSize: 16,
      color: AppColor.grey,
      fontWeight:FontWeight.w600 ,
    ),
  ),
);


ThemeData themeArbic = ThemeData(
  fontFamily: "Cairo",
  textTheme: TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: AppColor.black,
    ),
    headlineMedium: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: AppColor.black,
    ),
    bodyMedium: const TextStyle(
      fontSize: 16,
      color: AppColor.grey,
      fontWeight:FontWeight.w600 ,
    ),
  ),
);