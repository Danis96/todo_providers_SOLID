import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';
import 'package:todo/common/common_tappable_text.dart';

Widget registerTappable({Function(int) onPressed}) {
  return TappableText(
    text: 'Already have a account? Login',
    links: 'Login',
    onPressed: onPressed,
    linkStyle: TextStyle(
      color: ColorHelper.mainPurple.color,
    ),
  );
}
