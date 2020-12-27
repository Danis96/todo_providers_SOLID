import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';

Widget homeUnderAppBarContainer() {
  return Container(
    height: 20,
    decoration: BoxDecoration(
      color: ColorHelper.mainPurple.color,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
      ),
    ),
  );
}
