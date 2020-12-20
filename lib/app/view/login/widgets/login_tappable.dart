import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';
import 'package:todo/common/common_tappable_text.dart';

Widget loginTappable({Function(int) onPressed}) {
  return TappableText(
    text: "Don't have account? Create a new account",
    links: 'Create a new account',
    onPressed: onPressed,
    linkStyle: TextStyle(
      color: ColorHelper.mainPurple.color,
    ),
  );
}
