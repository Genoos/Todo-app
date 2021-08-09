import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../models/Task.dart';

class TodoList with ChangeNotifier{
  List<Task> _todos = [
    Task(
      id: 'l1',
      createdTime: DateTime.now().toString(),
      title: 'Buy Food ',
      description: '''- Eggs
- Milk
- Bread
- Water''',
    ),
    Task(
      id: 'l2',
      createdTime: DateTime.now().toString(),
      title: 'Complete Homeworky',
      description: '''- Maths
- SCIENCE
''',
    ),
    Task(
      id: 'l3',
      createdTime: DateTime.now().toString(),
      title: 'Exercise',
    ),
    Task(
      id: 'l4',
      createdTime: DateTime.now().toString(),
      title: 'Title',
    ),
  ];
  List<Task> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Task> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Task todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Task todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(Task todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Task todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }


}

