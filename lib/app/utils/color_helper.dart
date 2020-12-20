import 'dart:ui';

import 'package:flutter/material.dart';

enum ColorHelper {
  mainPurple,
  lightPurple,
  todoBlack,
  todoWhite,
}

extension ColorExtension on ColorHelper {
  Color get color {
    switch (this) {
      case ColorHelper.mainPurple:
        return const Color.fromRGBO(62, 64, 198, 1);
      case ColorHelper.lightPurple:
        return const Color.fromRGBO(159, 169, 223, 1);
      case ColorHelper.todoBlack:
        return const Color.fromRGBO(0, 0, 0, 1);
      case ColorHelper.todoWhite:
        return const Color.fromRGBO(255, 255, 255, 1);
    }
    return Colors.white;
  }
}
