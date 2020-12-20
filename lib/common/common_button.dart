import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';

Widget commonButton({
  @required Function onPressed,
  String text,
  bool disable = false,
}) {
  return Container(
    height: 50,
    child: RaisedButton(
      onPressed: () => disable ? null : onPressed(),
      color: disable ? ColorHelper.lightPurple.color  : ColorHelper.mainPurple.color,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: ColorHelper.todoWhite.color,
          fontSize: 18,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
    ),
  );
}
