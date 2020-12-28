import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/models/task_model.dart';
import 'package:todo/app/models/user_model.dart';
import 'package:todo/app/providers/auth_provider.dart';
import 'package:todo/app/providers/tasks_provider.dart';
import 'package:todo/app/utils/color_helper.dart';
import 'package:todo/app/view/home/widgets/home_app_bar.dart';
import 'package:todo/app/view/home/widgets/home_buttons.dart';
import 'package:todo/app/view/home/widgets/home_empty_state.dart';
import 'package:todo/app/view/home/widgets/home_todo_card.dart';
import 'package:todo/app/view/home/widgets/home_todo_section.dart';
import 'package:todo/common/common_loader.dart';
import 'package:todo/common/common_popup_dialog.dart';
import 'package:todo/routing/routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _initializeHomeData();
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    final TaskProvider taskProvider =
        Provider.of<TaskProvider>(context, listen: true);
    final List<TaskModel> tasks =
        Provider.of<TaskProvider>(context, listen: true).taskModels;
    final UserModel userModel =
        Provider.of<AuthProvider>(context, listen: true).userModel;

    return Scaffold(
      bottomNavigationBar: addTaskButton(
        onPressed: () => Navigator.of(context).pushNamed(AddNewTask),
      ),
      appBar: homeAppBar(
        context: context,
        authProvider: authProvider,
      ),
      body: WillPopScope(
        onWillPop: () => null,
        child: RefreshIndicator(
          onRefresh: () => _initializeHomeData(),
          child: ListView(
            children: <Widget>[
              thingsToDoSection(
                numberOfThingsTodo:
                    tasks.length - taskProvider.finishedTasks.length,
              ),
              if (tasks != null || tasks.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int i) {
                    final TaskModel task = tasks[i];
                    return Dismissible(
                      key: Key(task.documentReference.toString()),
                      onDismissed: (DismissDirection direction) {
                        tasks.removeAt(i);
                        taskProvider.deleteTask(taskID: task.documentReference);
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
                              taskID: task.documentReference,
                            )
                                .then((_) {
                              Navigator.of(context).pop();
                              _initializeHomeData()
                                  .then((_) => Navigator.of(context).pop());
                            });
                          },
                          onRightButtonPressed: null,
                          image: '',
                          model: task,
                        ),
                        child: todoCard(
                          task: task,
                          taskProvider: taskProvider,
                          user: userModel,
                          context: context,
                          id: i,
                        ),
                      ),
                    );
                  },
                )
              else
                emptyStateForTasks(),
            ],
          ),
        ),
      ),
    );
  }
}
