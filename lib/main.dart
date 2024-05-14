import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'mainUI/Todo.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('Database');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Todo(),
    );
  }
}
