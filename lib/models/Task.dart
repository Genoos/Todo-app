
class Task{
  String id;
  String title;
  final String createdTime;
  String description;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.createdTime,
    this.description = '',
    this.isDone = false
  });
}