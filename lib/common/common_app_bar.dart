import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';

PreferredSizeWidget commonAppBar({
  double elevation,
  Color backgroundColor,
  Widget leading,
  Widget action,
  @required String title,
}) {
  return AppBar(
    backgroundColor: backgroundColor ?? ColorHelper.todoWhite.color,
    elevation: elevation ?? 1,
    centerTitle: true,
    leading: leading,
    title: Text(
      title,
      style: TextStyle(
        color: ColorHelper.todoWhite.color,
        fontWeight: FontWeight.w400,
      ),
    ),
    actions: <Widget>[
      action,
    ],
  );
}
