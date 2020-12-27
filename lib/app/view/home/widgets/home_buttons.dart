
import 'package:flutter/material.dart';
import 'package:todo/common/common_button.dart';

Widget addTaskButton({@required Function onPressed}) {
  return Container(
    child: commonButton(
      onPressed: onPressed,
      text: 'Add task',
      buttonType: ButtonType.bottomButton,
    ),
  );
}
