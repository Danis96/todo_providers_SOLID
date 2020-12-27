import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  TaskProvider() {}

  final CollectionReference firestore =
      FirebaseFirestore.instance.collection('tasks');

  List<TaskModel> _taskModels = <TaskModel>[];
  List<TaskModel> get taskModels => _taskModels;
  List<TaskModel> _finishedTasks = <TaskModel>[];
  List<TaskModel> get finishedTasks => _finishedTasks;

  String _finishTaskError;
  String get finishTaskError => _finishTaskError;
  String _addTaskError;
  String get addTaskError => _addTaskError;

  DateTime dueDate;

  /// to change ui state
  void finished({int id}) {
    taskModels[id].isDone = !taskModels[id].isDone;
    notifyListeners();
  }

  /// fetch all tasks
  Future<void> fetchTasks() async {
    try {
      _taskModels = <TaskModel>[];
      _finishedTasks = <TaskModel>[];

      await firestore.get().then((QuerySnapshot value) {
        // ignore: avoid_function_literals_in_foreach_calls
        value.docs.forEach((QueryDocumentSnapshot snap) {
          _taskModels.add(TaskModel.fromDocument(snap.data()));
          if (snap.data()['is_done'] == true) {
            _finishedTasks.add(TaskModel.fromDocument(snap.data()));
          }
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
    _finishTaskError = null;
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
      final List<String> errors = e.toString().split(']');
      _finishTaskError = errors[1];
    }
  }

  Future<void> addNewTask({
    @required String date,
    @required String title,
    @required String userID,
    @required String description,
  }) async {
    _addTaskError = null;
    try {
      Map<String, dynamic> task = <String, dynamic>{
        'date': date,
        'is_done': false,
        'task_id': '',
        'title': title,
        'user_id': userID,
        'description': description,
      };
      print(task);
      final DocumentReference doc = await firestore.add(task);
      Map<String, dynamic> taskFinal = <String, dynamic>{
        'date': date,
        'is_done': false,
        'task_id': doc.id,
        'title': title,
        'user_id': userID,
        'description': description,
      };
      _taskModels.add(TaskModel.fromDocument(taskFinal));
      await firestore.doc(doc.id).update(taskFinal);
      notifyListeners();
    } catch (e) {
      print(e);
      final List<String> errors = e.toString().split(']');
      _addTaskError = errors[1];
    }
  }

  void getLocalDate(DateTime dateFromPicker) {
    dueDate = dateFromPicker;
    notifyListeners();
  }
}
