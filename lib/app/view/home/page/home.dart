import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/models/task_model.dart';
import 'package:todo/app/models/user_model.dart';
import 'package:todo/app/providers/auth_provider.dart';
import 'package:todo/app/providers/tasks_provider.dart';
import 'package:todo/app/view/home/widgets/home_app_bar.dart';
import 'package:todo/app/view/home/widgets/home_todo_card.dart';
import 'package:todo/app/view/home/widgets/home_todo_section.dart';
import 'package:todo/app/view/home/widgets/home_under_app_bar_container.dart';
import 'package:todo/common/common_loader.dart';

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
    Provider.of<TaskProvider>(context, listen: false)
        .fetchTasks()
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
      appBar: homeAppBar(
        context: context,
        authProvider: authProvider,
      ),
      body: WillPopScope(
        onWillPop: () => null,
        child: ListView(
          children: <Widget>[
            homeUnderAppBarContainer(),
            thingsToDoSection(numberOfThingsTodo: tasks.length),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int i) {
                final TaskModel task = tasks[i];
                return todoCard(
                  task: task,
                  taskProvider: taskProvider,
                  user: userModel,
                  context: context,
                  id: i,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
