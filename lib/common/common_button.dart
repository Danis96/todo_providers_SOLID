import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';

Widget commonButton({
  @required Function onPressed,
  String text,
}) {
  return Container(
    height: 50,
    child: RaisedButton(
      onPressed: () => onPressed(),
      color: ColorHelper.mainPurple.color,
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
