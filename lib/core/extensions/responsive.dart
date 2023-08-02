import 'package:flutter/material.dart';

class ScreenSize {
  static final ScreenSize _instance = ScreenSize._init();

  ScreenSize._init();

  factory ScreenSize.getInstance() {
    return _instance;
  }

  late Size screenSize;

  double get deviceWidth => screenSize.width;
  double get deviceHeight => screenSize.height;

  // burada responsive genişligi hesapladım
  double setWidth({required double width}) {
    if (deviceWidth == 0 || deviceHeight == 0) return 0.0;

    return screenSize.width / (deviceWidth / width);
  }

  // burada responcive uzunluğunu hesapladım

  double setHeight({required double height}) {
    if (deviceHeight == 0 || deviceWidth == 0) return 0.0;

    return screenSize.height / (deviceHeight / height);
  }
}
