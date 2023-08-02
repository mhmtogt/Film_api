import 'package:api_1/core/extensions/responsive.dart';

extension NumExtension on num {
  double get w => ScreenSize().setWidth(width: toDouble());
  double get h => ScreenSize().setHeight(height: toDouble());
}
