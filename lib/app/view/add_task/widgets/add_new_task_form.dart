import 'package:flutter/material.dart';
import 'package:todo/app/models/user_model.dart';
import 'package:todo/app/providers/tasks_provider.dart';
import 'package:todo/app/utils/color_helper.dart';

import 'add_new_task_form_button.dart';
import 'add_task_choose_date.dart';
import 'add_task_text_form_fields.dart';

Widget addNewTaskForm({
  @required TextEditingController titleController,
  @required TextEditingController descriptionController,
  @required BuildContext context,
  @required DateTime selectedDate,
  @required GlobalKey<FormState> addNewTaskFormKey,
  @required TaskProvider taskProvider,
  @required UserModel userModel,
}) {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme:
                ColorScheme.light(primary: ColorHelper.mainPurple.color),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      taskProvider.getLocalDate(picked);
    }
  }

  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    child: Form(
      key: addNewTaskFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleTextFormField(controller: titleController),
          chooseDate(_selectDate, context, taskProvider.dueDate, selectedDate),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: descTextFormField(
              controller: descriptionController,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: formButton(
              addNewTaskFormKey: addNewTaskFormKey,
              context: context,
              titleController: titleController,
              descriptionController: descriptionController,
              selectedDate: taskProvider.dueDate,
              taskProvider: taskProvider,
              userModel: userModel,
            ),
          ),
        ],
      ),
    ),
  );
}
