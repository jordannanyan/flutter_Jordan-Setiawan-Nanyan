class TaskModel {
  late int? id;
  late String taskName;
  late String taskNumber;

  TaskModel({
    this.id,
    required this.taskName,
    required this.taskNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskName': taskName,
      'taskNumber': taskNumber,
    };
  }

  TaskModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    taskName = map['taskName'];
    taskNumber = map['taskNumber'];
  }
}
