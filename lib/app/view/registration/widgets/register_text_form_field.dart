import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';
import 'package:todo/common/common_empty_container.dart';
import 'package:todo/common/common_text_form_field.dart';

Widget emailRegisterTextFormField({
  @required TextEditingController controller,
  bool obscureText = false,
}) {
  return commonTextFormField(
    controller: controller,
    obscureText: obscureText,
    icon: commonEmptyContainer(),
    hintText: 'Email',
    hintColor: ColorHelper.todoBlack.color,
  );
}

Widget passwordRegisterTextFormField({
  @required TextEditingController controller,
  bool obscureText = false,
}) {
  return PasswordTextFormField(
    obscureText: true,
    controller: controller,
    icon: commonEmptyContainer(),
    hintText: 'Password',
    hintColor: ColorHelper.todoBlack.color,
  );
}

Widget confirmPasswordRegisterTextFormField({
  @required TextEditingController controller,
  bool obscureText = false,
}) {
  return PasswordTextFormField(
    obscureText: true,
    controller: controller,
    icon: commonEmptyContainer(),
    hintText: 'Confirm Password',
    hintColor: ColorHelper.todoBlack.color,
  );
}
