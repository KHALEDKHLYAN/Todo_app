import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List toDoList = [];

  //reference our box
  final _myBox = Hive.box('mybox');

  //run this  method  if  is the first time  ever
  void createInitialData() {
    toDoList = [
      ['Make A frmaWork', false],
      ['Reschedule for a Meeting', false],
    ];
  }

  //load the data from database
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  //update the database
  void updateDatabase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
