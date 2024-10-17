import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list_app/data/database.dart';
import 'package:todo_list_app/screen/home/todolist.dart';
import 'package:todo_list_app/screen/widgets/dialog_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//reference the hive_box
  final  _myBox = Hive.box('mybox');
  TodoDatabase db  = TodoDatabase();

  @override
  void initState() {
    if(_myBox.get('TODOLIST')==null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  final _controller=TextEditingController();



  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  //Save New Task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createNewTask(){
    showDialog(context: context, 
    builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: ()=>Navigator.of(context).pop(),
      );
    });
  }

  void deleteTask(index){
    setState(() {
    db.toDoList.removeAt(index);  
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
            title: const Text('To Do List App'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.yellow),
        floatingActionButton: FloatingActionButton(onPressed: createNewTask,
        backgroundColor: Colors.yellow,
        child: Icon(Icons.add),),
        body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: db.toDoList[index][0],
                taskCompleted: db.toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context)=>deleteTask(index),
              );
            }));
  }
}
