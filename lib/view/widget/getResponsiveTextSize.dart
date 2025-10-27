import 'package:flutter/material.dart';

double getResponsiveTextSize(BuildContext context, double fontSize) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}


double getScaleFactor(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  if(screenWidth <= 600) {
    return screenWidth / 400;
  }else if (screenWidth <=900){
    return screenWidth / 700;
  }else {
    return screenWidth / 1000;
  }
}