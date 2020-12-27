import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';

Widget emptyStateForTasks() {
  return Container(
    margin: const EdgeInsets.only(top: 200),
    child: Column(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          child: Image.asset(
            'assets/feather.png',
            color: ColorHelper.todoGrey.color,
          ),
        ),
        Container(
          child: Text(
            'There are currently no tasks to do',
            style: TextStyle(
              color: ColorHelper.todoGrey.color,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}