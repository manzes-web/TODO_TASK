import 'package:hive_flutter/hive_flutter.dart';

class Database {
  final myBox = Hive.box('Database');

  List todolist = [];

  void firstOpen() {
    todolist = [
      ['hello ', false]
    ];
  }

  void loadData() {
    todolist = myBox.get('TODOLIST');
  }

  void updateData() {
    myBox.put('TODOLIST', todolist);
  }
}
