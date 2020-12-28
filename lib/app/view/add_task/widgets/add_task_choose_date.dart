import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';
import 'package:todo/app/utils/date_time_extensions.dart';

Widget chooseDate(
  Function onPressed,
  BuildContext context,
  DateTime selectedDate,
  DateTime now,
) {
  return GestureDetector(
    onTap: () => onPressed(context),
    child: Container(
      margin: const EdgeInsets.only(top: 8),
      width: 150,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            color: ColorHelper.mainPurple.color,
            size: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Text(
              selectedDate == null
                  ? now.dateToString()
                  : selectedDate.dateToString(),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: ColorHelper.todoGrey.color,
          borderRadius: BorderRadius.circular(6.0)),
    ),
  );
}
