import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../Utils.dart';
import '../providers/todo.dart';
import '../models/Task.dart';
import '../screens/editscreen.dart';
import '../screens/description.dart';


class TaskWidget extends StatelessWidget {
  final Task todo;
  TaskWidget(this.todo);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
        key: Key(todo.id),
        actionPane: SlidableDrawerActionPane(),
        actions: [
          IconSlideAction(
            color: Colors.green,
            onTap: ()=>editTodo(context, todo),
            caption: 'Edit',
            icon: Icons.edit,
          )
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            onTap: (){deleteTodo(context, todo);},
            caption: 'Delete',
            icon: Icons.delete,
          )
        ],
        child: taskStyle(context),
      ),

    );
  }
  Widget taskStyle(BuildContext context){
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.lightBlueAccent),
        child: ListTile(

          leading: Checkbox(
            value: todo.isDone,
            onChanged: (_){
              final provider = Provider.of<TodoList>(context,listen: false);
              final isDone = provider.toggleTodoStatus(todo);

              Utils.showSnackBar(context, isDone?'Task Finished !': 'task incomplete');
            },
          ),
          title:Text(
            todo.title,
            style: TextStyle(

              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              fontSize: 22,
            ),
          ) ,
          subtitle: Text('${todo.createdTime}'),
          trailing: IconButton( icon:Icon(Icons.visibility),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Description(des: todo.description,)),
              );

              },),

        ),

    );
  }
  void deleteTodo(BuildContext context, Task todo) {
    final provider = Provider.of<TodoList>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }
  void editTodo(BuildContext context, Task todo) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditTask(todo: todo),
    ),
  );


}

//,
