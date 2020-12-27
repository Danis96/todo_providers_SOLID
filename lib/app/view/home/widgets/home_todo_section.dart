import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';

Widget thingsToDoSection({@required int numberOfThingsTodo = 0}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 24.0,
    ),
    margin: const EdgeInsets.only(
      top: 20.0,
    ),
    child: Row(
      children: <Widget>[
        /// headline
        Container(
          child: Text(
            'Things to do',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
              color: ColorHelper.todoBlack.color,
            ),
          ),
        ),

        /// task count
        Container(
          margin: const EdgeInsets.only(
            left: 10,
          ),
          child: Center(
            child: Text(
              numberOfThingsTodo.toString(),
              style: TextStyle(
                color: ColorHelper.todoWhite.color,
              ),
            ),
          ),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: ColorHelper.lightPurple.color,
            shape: BoxShape.circle,
          ),
        ),
      ],
    ),
  );
}
