// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_list_app/screen/home/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  //Init the hive
  await Hive.initFlutter();

  //OPen  the box
  var  box = await Hive.openBox('mybox');


  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: HomeScreen(),
    );
  }
}
