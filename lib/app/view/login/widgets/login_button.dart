import 'package:flutter/material.dart';
import 'package:todo/common/common_button.dart';

Widget loginButton({
  @required Function onPressed,
}) {
  return commonButton(onPressed: onPressed, text: 'Login');
}