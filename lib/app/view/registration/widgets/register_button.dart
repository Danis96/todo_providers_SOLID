import 'package:flutter/material.dart';
import 'package:todo/common/common_button.dart';

Widget registerButton({
  @required Function onPressed,
}) {
  return commonButton(
    onPressed: onPressed,
    text: 'Create account',
  );
}
