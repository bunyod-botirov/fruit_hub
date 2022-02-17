import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? _screenWidth;
  static double? _screenHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData!.size.width;
    _screenHeight = _mediaQueryData!.size.height;
  }
}

double height(double inputHeight) {
  return (inputHeight / 812.0) * SizeConfig._screenHeight!;
}

double width(double inputWidth) {
  return (inputWidth / 375.0) * SizeConfig._screenWidth!;
}
