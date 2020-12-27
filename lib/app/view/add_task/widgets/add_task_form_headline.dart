import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';

Widget formHeadline() {
  return Container(
    child: Text(
      'Create a new task',
      style: TextStyle(
        color: ColorHelper.todoBlack.color,
        fontWeight: FontWeight.w400,
        fontSize: 26,
      ),
    ),
  );
}