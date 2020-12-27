import 'package:flutter/material.dart';
import 'package:todo/app/models/user_model.dart';
import 'package:todo/app/providers/tasks_provider.dart';
import 'package:todo/common/common_button.dart';
import 'package:todo/app/utils/date_time_exensions.dart';
import 'package:todo/common/common_loader.dart';
import 'package:todo/common/common_popup_dialog.dart';
import 'package:todo/routing/routes.dart';

Widget formButton({
  @required GlobalKey<FormState> addNewTaskFormKey,
  @required BuildContext context,
  @required TextEditingController titleController,
  @required TextEditingController descriptionController,
  @required DateTime selectedDate,
  @required TaskProvider taskProvider,
  @required UserModel userModel,
}) {
  return commonButton(
    onPressed: () async {
      loaderDialog(context: context);
      FormState form = addNewTaskFormKey.currentState;
      if (form.validate()) {
        /// title
        /// desc
        /// date
        await taskProvider
            .addNewTask(
          date: selectedDate.dateToString(),
          title: titleController.text,
          description: descriptionController.text,
          userID: userModel.uid,
        )
            .then((_) {
          Navigator.of(context).pop();
          if (taskProvider.addTaskError != null) {
            showCommonDialog(
              context: context,
              text: taskProvider.addTaskError,
              onButtonPressed: () => Navigator.of(context).pop(),
              image: 'assets/error.png',
            );
          } else {
            Navigator.of(context).pushNamed(Home);
          }
        });
      } else {
        Navigator.of(context).pop();
      }
    },
    text: 'Save task',
  );
}
