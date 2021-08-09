import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'screens/Onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../providers/todo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=>TodoList(),
        child:MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'IndieFlower',
            primaryColor: Colors.deepOrange,
            primarySwatch: Colors.blue,
            accentColor: Colors.blueAccent,
            backgroundColor: Colors.blueAccent,
          ),

        home: MyHomepage(),
    )
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3,),openOnBoard);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('fonts/icons.gif',fit: BoxFit.cover,height: 100,width: 100,),
        ),
      ),
    );
  }
  void openOnBoard(){
    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Onboarding()));
  }
}


