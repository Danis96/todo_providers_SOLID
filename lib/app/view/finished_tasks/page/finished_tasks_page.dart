import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/models/task_model.dart';
import 'package:todo/app/models/user_model.dart';
import 'package:todo/app/providers/auth_provider.dart';
import 'package:todo/app/providers/tasks_provider.dart';
import 'package:todo/app/view/finished_tasks/widgets/finished_task_app_bar.dart';
import 'package:todo/app/view/home/widgets/home_empty_state.dart';
import 'package:todo/app/view/home/widgets/home_todo_card.dart';

class FinishedTasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<TaskModel> finishedTasks =
        Provider.of<TaskProvider>(context, listen: true).finishedTasks;
    final TaskProvider taskProvider =
        Provider.of<TaskProvider>(context, listen: false);
    final UserModel user =
        Provider.of<AuthProvider>(context, listen: false).userModel;

    return Scaffold(
      appBar: finishedAppBar(context),
      body: Container(
        child: finishedTasks != null || finishedTasks.isNotEmpty
            ? ListView.builder(
                itemCount: finishedTasks.length ?? 0,
                itemBuilder: (BuildContext context, int i) {
                  final TaskModel finishSingle = finishedTasks[i];
                    return todoCard(
                      task: finishSingle,
                      taskProvider: taskProvider,
                      user: user,
                      context: context,
                      id: i,
                      isClickable: false,
                    );
                },
              )
            : emptyStateForTasks(),
      ),
    );
  }
}
