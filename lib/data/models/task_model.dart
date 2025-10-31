class TaskModel {
  int id;
  String title;
  String description;
  bool iscompleted;
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    this.iscompleted = false,
  });
}
