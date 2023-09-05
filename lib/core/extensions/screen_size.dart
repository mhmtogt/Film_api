import 'package:flutter/material.dart';

class ScreenSize {
  static final ScreenSize _instance = ScreenSize._init(); // singleton 

  ScreenSize._init();

  late Size screenSize;

  factory ScreenSize() {
    return _instance;
  }

  double get deviceWidth => screenSize.width;
  double get deviceHeight => screenSize.height;

  double setWidth({required double width}) {
    if (deviceWidth == 0 || deviceHeight == 0) return 0.0;

    return screenSize.width / (deviceWidth / width);
  }

  double setHeight({required double height}) {
    if (deviceHeight == 0 || deviceWidth == 0) return 0.0;

    return screenSize.height / (deviceHeight / height);
  }
}
