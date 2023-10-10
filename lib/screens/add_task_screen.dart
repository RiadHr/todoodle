import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';

import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late Task task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Color(0xffe0e0e9),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Add new task',
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'comfortaa',
                  fontWeight: FontWeight.bold),
            ),
             TextField(
              onChanged: (value) {
                task = Task(name: value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
            TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color(0xff5d82ee),
                ),
              ),
              onPressed: () {
                Provider.of<TaskData>(context,listen: false).addTask(task);
                setState(() {

                });
              },
              child: const Text(
                'add',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
