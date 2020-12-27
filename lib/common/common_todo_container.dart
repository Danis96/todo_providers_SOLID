import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';

Widget todoContainer({
  String title,
  String dateOfEntrance,
  String dateOfExpiration,
  String type,
}) {
  return Container(
    height: 100,
    decoration: BoxDecoration(
        color: ColorHelper.mainPurple.color,
        borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    'Learn Flutter',
                    style: TextStyle(
                      color: ColorHelper.todoWhite.color,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Date 123456',
                        style: TextStyle(
                          color: ColorHelper.todoWhite.color,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Date 123456',
                        style: TextStyle(
                          color: ColorHelper.todoWhite.color,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
