import 'package:flutter/material.dart';

class ScreenSize {
  static final ScreenSize _instance = ScreenSize._init();
 Size screenSize;

  ScreenSize._init() : screenSize = Size(0, 0);

  factory ScreenSize() {
    return _instance;
  }

  void init(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
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
