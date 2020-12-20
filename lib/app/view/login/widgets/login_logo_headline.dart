import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';


Widget logoHeadline() {
  return Column(
    children: <Widget>[
      Container(
        margin: const EdgeInsets.only(top: 70.0),
        child: Image.asset(
          'assets/feather.png',
          width: 100,
          height: 100,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Text(
          'Welcome Back',
          style: TextStyle(
            color: ColorHelper.mainPurple.color,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Text(
          'Sign to continue',
          style: TextStyle(
            color: ColorHelper.lightPurple.color,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
      ),
    ],
  );
}
