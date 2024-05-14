// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_task/Database/database.dart';
import 'package:todo_task/mainUI/dialogbox.dart';

import '../values/colors.dart';
import 'todo_task.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final myBox = Hive.box('Database');
  Database db = Database();
  final controller = TextEditingController();
  // List todolist = [
  //   ["hello man", true],
  //   ["hello women", false],
  // ];
  @override
  void initState() {
    if (myBox.get('TODOLIST') == null) {
      db.firstOpen();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updateData();
  }

  void addNewTask() {
    print(controller.text);
    setState(() {
      if (controller.text.isNotEmpty) {
        db.todolist.add([controller.text, false]);
      }
      controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createTodoTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onADD: () => addNewTask(),
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  deleteTask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text(
          'TODO TASK',
          style: TextStyle(color: Colors.white),
        ),
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2)),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: db.todolist.length,
          itemBuilder: (context, index) {
            return TodoTask(
              todotask: db.todolist[index][0],
              iscompleted: db.todolist[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              delete: (context) => deleteTask(index),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: createTodoTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
