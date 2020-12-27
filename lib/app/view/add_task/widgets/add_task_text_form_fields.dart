import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';
import 'package:todo/common/common_text_form_field.dart';

Widget titleTextFormField({
  TextEditingController controller,
}) {
   return commonTextFormField(
     controller: controller,
     hintText: 'Task title',
     obscureText: false,
     hintColor: ColorHelper.todoBlack.color,
   );
}

Widget descTextFormField({
  TextEditingController controller,
}) {
   return commonTextFormField(
     controller: controller,
     hintText: 'Description',
     obscureText: false,
     hintColor: ColorHelper.todoBlack.color,
     maxLines: 10,
     minLines: 10,
   );
}