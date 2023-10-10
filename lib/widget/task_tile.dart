import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final bool taskState;
  final Function checkboxHandler;
  final Function longPressHandler;
  TaskTile({required this.taskName,required this.taskState,
    required this.checkboxHandler,
    required this.longPressHandler});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () => longPressHandler(),
      leading:Checkbox(
        shape: CircleBorder(
          side: BorderSide.lerp(BorderSide(color: Colors.white), BorderSide(color: Colors.white), 5)
        ),
        onChanged: (value) {
            checkboxHandler(value);
        },
        value: taskState,
      ),
      trailing:Text(taskName,style: TextStyle(decoration: taskState ? TextDecoration.lineThrough : null,
      color: Colors.white,
      fontSize: 22,
      )),

    );
  }
}
