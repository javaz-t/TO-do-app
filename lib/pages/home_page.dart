import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_dos/data/databse.dart';
import 'package:to_dos/widgets/dialoguteo_box.dart';
import 'package:to_dos/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _my_box = Hive.box('hey');
  TodoDataBase db = TodoDataBase();
  final _copyText = TextEditingController();

  //controller used to grab the dat from the textField
  //when we type the text and save the text need to be copyied
  //it will add to save task [below list def]

  @override
  void initState() {
    if (_my_box.get('ToDoList') == null) {
      db.createInialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void chekBoxChange(bool? value, int index) {
    setState(() {
      //value opposite avm
      db.todos[index][1] = !db.todos[index][1];
    });
    db.updateDatabase();
  }

  void saveTask() {
    final value = _copyText.text;
    setState(() {
      if (value.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('please enter your task')));
        return;
      }
      db.todos.add([_copyText.text, false]);
      _copyText.clear(); //to clear wn reopen
      Navigator.of(context).pop();
    });
    db.updateDatabase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogueBox(
            copyText: _copyText,
            onSave: saveTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
    db.updateDatabase();
  }

  void onDelete(index) {
    setState(() {
      db.todos.removeAt(index);
    }); 
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.amber,
        title: Text('      ToDo App',style: TextStyle(fontSize: 25,),),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),),
         
        ),
      //  centerTitle: true, 
        elevation: 0,
      ),             
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask, 
        child: Icon(Icons.add,),
   
      ),
      body: Center(
          child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return todoTile(
                      taskName: db.todos[index][0],
                      taskComplete: db.todos[index][1],
                      doneORNot: (value) => chekBoxChange(value, index),
                      onDelete: (context) => onDelete(index));
                },
                itemCount: db.todos.length,
              )
              //length of given list
              )),
    );
  }
}
