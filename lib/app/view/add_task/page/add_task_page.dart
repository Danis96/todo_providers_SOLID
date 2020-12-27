import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/models/user_model.dart';
import 'package:todo/app/providers/auth_provider.dart';
import 'package:todo/app/providers/tasks_provider.dart';
import 'package:todo/app/utils/color_helper.dart';
import 'package:todo/app/view/add_task/widgets/add_new_task_form.dart';
import 'package:todo/app/view/add_task/widgets/add_task_app_bar.dart';
import 'package:todo/app/view/add_task/widgets/add_task_form_headline.dart';

class AddNewTaskPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final GlobalKey<FormState> _addNewTaskFormKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    final TaskProvider taskProvider =
    Provider.of<TaskProvider>(context, listen: true);
    final UserModel userModel =
    Provider.of<AuthProvider>(context, listen: false).userModel;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: addTaskAppBar(context),
      body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              decoration: BoxDecoration(
                  border: Border.all(color: ColorHelper.todoGrey.color,),
                borderRadius: BorderRadius.circular(12.0)
              ),
              child: addTaskFormContainer(
                descriptionController: _descriptionController,
                titleController: _titleController,
                context: context,
                selectedDate: selectedDate,
                addNewTaskFormKey: _addNewTaskFormKey,
                taskProvider: taskProvider,
                userModel:userModel,
              ),
            ),
          ]),
    );
  }
}

Widget addTaskFormContainer({
  @required TextEditingController titleController,
  @required TextEditingController descriptionController,
  @required BuildContext context,
  @required DateTime selectedDate,
  @required GlobalKey<FormState> addNewTaskFormKey,
  @required TaskProvider taskProvider,
  @required UserModel userModel,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /// headline,
        formHeadline(),
        addNewTaskForm(
          titleController: titleController,
          descriptionController: descriptionController,
          context: context,
          selectedDate: selectedDate,
          addNewTaskFormKey: addNewTaskFormKey,
          taskProvider: taskProvider,
          userModel:userModel,
        ),
      ],
    ),
  );
}
