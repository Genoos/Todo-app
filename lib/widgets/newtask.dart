import 'package:flutter/material.dart';
import 'package:todo/models/Task.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo.dart';
import 'package:intl/intl.dart';
import 'form.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String title = '';
  String description = '';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Form(
            key: _formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('add task',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                const SizedBox(height: 8),
                FormWidget(
                  onChangedTitle: (title) => setState(() => this.title = title),
                  onChangedDescription: (description) =>
                      setState(() => this.description = description),
                  onSavedTodo: addTodo,

                ),
              ],
            ),
          ),


      );

  }
  void addTodo(){
    final isValid = _formkey.currentState!.validate();
    if (!isValid){
      return;
    }
    else{
      DateTime date = DateTime.now();
      final todo = Task(id: DateTime.now().toString(), title: title, createdTime: DateFormat.yMd().format(date));
      final provider = Provider.of<TodoList>(context,listen: false);
      provider.addTodo(todo);
      Navigator.of(context).pop();
    }
  }
}
