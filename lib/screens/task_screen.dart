import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/widget/task_list.dart';

import 'add_task_screen.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Widget? showAddTaskScreenHandler() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddTaskScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          child: TextButton(
            child: const Icon(
              Icons.add,
              color: Color(0xff5d82ee),
              size: 50,
            ),
            onPressed: () => showAddTaskScreenHandler(),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Row(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 24,bottom: 15),
                width: 150,
                child: const Image(image: AssetImage('images/todo1.png')))
          ],
        ),
      ),
      body: Column(
        children: [
          Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                '${Provider.of<TaskData>(context).tasks.length} task',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Comfortaa'

                ),
              ),
          ),
          Expanded(
            child: Material(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              elevation: 8,
              color: const Color(0xff5d82ee),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                width: double.infinity,
                child: TaskList(checkboxHandler: (int index, bool value){
                    setState(() {
                      Provider.of<TaskData>(context,listen: false).taskHandler(index);
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
