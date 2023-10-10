import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/screens/add_task_screen.dart';
import 'package:todo/screens/task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        initialRoute: 'taskscreen',
        routes: {
          'taskscreen': (context) => TaskScreen(),
        },
      ),
    );
  }
}
