import 'package:flutter/material.dart';
import 'package:todo/app/models/task_model.dart';
import 'package:todo/app/models/user_model.dart';
import 'package:todo/app/providers/tasks_provider.dart';
import 'package:todo/app/utils/color_helper.dart';
import 'package:todo/app/utils/size_config.dart';
import 'package:todo/common/common_loader.dart';
import 'package:todo/common/common_popup_dialog.dart';

Widget todoCard({
  @required TaskModel task,
  @required TaskProvider taskProvider,
  @required UserModel user,
  @required BuildContext context,
  @required int id,
  bool isClickable = true,
}) {
  bool taskDone = task.isDone ?? false;

  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 24.0,
    ),
    margin: const EdgeInsets.only(
      top: 15.0,
    ),
    child: Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: ColorHelper.todoGrey.color,
          ),
          borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        children: <Widget>[
          /// check toggle button
          Container(
            child: IconButton(
                icon: taskDone
                    ? Icon(
                        Icons.check_circle,
                        color: ColorHelper.todoGreenChecked.color,
                      )
                    : Icon(
                        Icons.circle,
                        color: ColorHelper.todoGrey.color,
                      ),
                iconSize: 30.0,
                onPressed: () {
                  if (isClickable) {
                    loaderDialog(context: context);
                    taskProvider
                        .finishTask(
                      title: task.title,
                      date: task.dueDate,
                      userID: user.uid,
                      taskID: task.documentReference,
                      isDone: task.isDone,
                    )
                        .then((_) async {
                      taskProvider.finished(id: id);
                      await taskProvider.fetchTasks(userID: user.uid);
                      Navigator.of(context).pop();
                      if (taskProvider.finishTaskError != null) {
                        showCommonDialog(
                          context: context,
                          text: taskProvider.finishTaskError,
                          onButtonPressed: () => Navigator.of(context).pop(),
                          image: 'assets/error.png',
                        );
                      } else {
                        if (task.isDone) {
                          showCommonDialog(
                            context: context,
                            text:
                                'Congratulations, task is successfully finished!!!',
                            onButtonPressed: () => Navigator.of(context).pop(),
                            image: 'assets/success.png',
                          );
                        }
                      }
                    });
                  }
                }),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: SizeConfig.blockSizeHorizontal * 65,
                child: Text(
                  task.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: ColorHelper.todoBlack.color,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    decoration: taskDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                width: 130,
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      color: ColorHelper.mainPurple.color,
                      size: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Text(task.dueDate),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: ColorHelper.todoGrey.color,
                    borderRadius: BorderRadius.circular(6.0)),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
