import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/widget/task_tile.dart';

class TaskList extends StatelessWidget {
  final Function checkboxHandler;
  TaskList({required this.checkboxHandler});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount:taskData.tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
                taskName: taskData.tasks[index].name,
                taskState: taskData.tasks[index].isDone,
                checkboxHandler: (bool value){
                    checkboxHandler(index,value);
                },
                longPressHandler: (){
                  taskData.removeTask(taskData.tasks[index]);
                },
            );
          },
        );
      },
    );
  }
}
