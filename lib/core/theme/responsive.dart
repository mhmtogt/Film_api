

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  double h(double value) => MediaQuery.of(this).size.height * value;
  double w(double value) => MediaQuery.of(this).size.width * value;
}
