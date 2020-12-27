import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  TaskProvider() {}

  final CollectionReference firestore =
      FirebaseFirestore.instance.collection('tasks');

  List<TaskModel> _taskModels = <TaskModel>[];
  List<TaskModel> get taskModels => _taskModels;

  /// to change ui state
  void finished({int id}) {
    taskModels[id].isDone = !taskModels[id].isDone;
    notifyListeners();
  }

  /// fetch all tasks
  Future<void> fetchTasks() async {
    try {
      _taskModels = <TaskModel>[];

      await firestore.get().then((QuerySnapshot value) {
        // ignore: avoid_function_literals_in_foreach_calls
        value.docs.forEach((QueryDocumentSnapshot snap) {
          _taskModels.add(TaskModel.fromDocument(snap.data()));
        });
      });
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  /// update task to be finished in firestore collection
  Future<void> finishTask({
    @required String title,
    @required String date,
    @required String userID,
    @required String taskID,
    @required bool isDone,
  }) async {
    try {
      isDone = !isDone;
      await firestore.doc(taskID).update(<String, dynamic>{
        'title': title,
        'date': date,
        'is_done': isDone,
        'task_id': taskID,
        'user_id': userID,
      });
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
