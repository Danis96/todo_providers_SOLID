
class TaskModel {
  TaskModel({
    this.isDone,
    this.title,
    this.dueDate,
    this.userID,
    this.documentReference,
  });

  factory TaskModel.fromDocument(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'] as String ?? '',
      userID: json['user_id'] as String ?? '',
      isDone: json['is_done'] as bool ?? false,
      dueDate: json['date'] as String ?? '',
      documentReference: json['task_id'] as String ?? '',
    );
  }

  String userID;
  String title;
  bool isDone;
  String dueDate;
  String documentReference;
}
