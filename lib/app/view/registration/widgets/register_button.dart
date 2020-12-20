import 'package:flutter/material.dart';
import 'package:todo/common/common_button.dart';

Widget registerButton({@required Function onPressed, bool disable}) {
  return commonButton(
      onPressed: onPressed, text: 'Create account', disable: disable);
}
