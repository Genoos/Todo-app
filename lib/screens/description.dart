import 'package:flutter/material.dart';
import '../models/Task.dart';

class Description extends StatelessWidget {

  final String des;

  const Description({Key? key, required this.des}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blueGrey,
            Colors.lightBlueAccent,
          ],),

      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: Text('Task INFO',style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Center(
          child:
               Text(des,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),) ),
      ),
    );
  }
}
