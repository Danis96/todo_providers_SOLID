import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/models/task_model.dart';
import 'package:todo/app/models/user_model.dart';
import 'package:todo/app/providers/auth_provider.dart';
import 'package:todo/app/providers/tasks_provider.dart';
import 'package:todo/app/utils/color_helper.dart';
import 'package:todo/app/view/finished_tasks/widgets/finished_task_app_bar.dart';
import 'package:todo/app/view/home/widgets/home_empty_state.dart';
import 'package:todo/app/view/home/widgets/home_todo_card.dart';
import 'package:todo/common/common_loader.dart';
import 'package:todo/common/common_popup_dialog.dart';

class FinishedTasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<TaskModel> finishedTasks =
        Provider.of<TaskProvider>(context, listen: true).finishedTasks;
    final TaskProvider taskProvider =
        Provider.of<TaskProvider>(context, listen: false);
    final UserModel user =
        Provider.of<AuthProvider>(context, listen: false).userModel;

    Future<void> _initializeHomeData() async {
      Future<void>(() {
        loaderDialog(context: context);
      });
      final UserModel userModel =
          Provider.of<AuthProvider>(context, listen: false).userModel;
      Provider.of<TaskProvider>(context, listen: false)
          .fetchTasks(
            userID: userModel.uid,
          )
          .then((_) => Navigator.of(context).pop());
    }

    return Scaffold(
      appBar: finishedAppBar(context),
      body: RefreshIndicator(
        onRefresh: () => _initializeHomeData(),
        child: Container(
          child: finishedTasks != null || finishedTasks.isNotEmpty
              ? ListView.builder(
                  itemCount: finishedTasks.length ?? 0,
                  itemBuilder: (BuildContext context, int i) {
                    final TaskModel finishSingle = finishedTasks[i];
                    return Dismissible(
                      key: Key(finishSingle.documentReference.toString()),
                      onDismissed: (DismissDirection direction) {
                        finishedTasks.removeAt(i);
                        taskProvider.deleteTask(
                            taskID: finishSingle.documentReference);
                      },
                      background: Container(
                        margin: const EdgeInsets.only(left: 200.0),
                        child: Icon(
                          Icons.delete,
                          color: ColorHelper.deleteRed.color,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () => showDetailsDialog(
                          context: context,
                          onLeftButtonPressed: () {
                            loaderDialog(context: context);
                            taskProvider
                                .deleteTask(
                              taskID: finishSingle.documentReference,
                            )
                                .then((_) {
                              Navigator.of(context).pop();
                              _initializeHomeData()
                                  .then((_) => Navigator.of(context).pop());
                            });
                          },
                          onRightButtonPressed: null,
                          image: '',
                          model: finishSingle,
                        ),
                        child: todoCard(
                          task: finishSingle,
                          taskProvider: taskProvider,
                          user: user,
                          context: context,
                          id: i,
                          isClickable: false,
                        ),
                      ),
                    );
                  },
                )
              : emptyStateForTasks(),
        ),
      ),
    );
  }
}
