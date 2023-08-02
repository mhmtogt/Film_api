import 'package:api_1/core/extensions/responsive.dart';

extension NumExtension on num {
  double get w => ScreenSize.getInstance().setWidth(width: toDouble());
  double get h => ScreenSize.getInstance().setHeight(height: toDouble());
}
