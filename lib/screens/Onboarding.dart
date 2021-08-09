import 'package:flutter/material.dart';
import '../widgets/Tasklist.dart';
import '../widgets/newtask.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: Text('TO DO',style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.lightBlueAccent
          ),
          body: Tasklist(),
          floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
            onPressed: () => showDialog(context: context, builder: (_)=>NewTask()),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            backgroundColor: Theme.of(context).accentColor,
      ),
      );

  }
}


