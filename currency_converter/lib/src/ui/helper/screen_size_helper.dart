import 'package:flutter/material.dart';

class ScreenSizeHelper {
  ScreenSizeHelper.of(this.context);

  final BuildContext context;

  Size get size => MediaQuery.sizeOf(context);

  double getWidth({
    double percentage = 1,
  }) {
    return size.width * percentage;
  }

  double getHeight({
    double percentage = 1,
  }) {
    return size.height * percentage;
  }
}
