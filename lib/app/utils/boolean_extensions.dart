import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';

extension BooleanCheck on bool {
  Widget taskStatus() {
    return this
        ? Icon(
            Icons.check_circle,
            color: ColorHelper.todoGreenChecked.color,
            size: 40,
          )
        : Icon(
            Icons.radio_button_unchecked,
            color: ColorHelper.deleteRed.color,
            size: 40,
          );
  }
}
