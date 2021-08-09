import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todo/providers/todo.dart';
import 'package:todo/widgets/taskwidget.dart';

import '../models/Task.dart';

class Tasklist extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoList>(context);
    final todos = provider.todos;
    return provider.todos.isEmpty?
        Center(child: Text('NO TASKS !',style: TextStyle(fontSize: 15),))
        :ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        separatorBuilder: (context,index)=>Container(height: 8,),
        itemCount: todos.length,
        itemBuilder: (ctx,index){
          return TaskWidget(todos[index]);
        });
  }
  


}
