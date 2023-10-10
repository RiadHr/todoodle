import 'package:flutter/cupertino.dart';
import 'package:todo/models/task.dart';

class TaskData extends ChangeNotifier{
      List<Task> tasks=[
        Task(name: 'go gym'),
        Task(name: 'go work')
      ];

      void taskHandler(int index){
        tasks[index].toggleTask();
        notifyListeners();
      }

      void addTask(Task task){
        tasks.add(task);
        notifyListeners();
      }


      void removeTask(Task task){
        tasks.remove(task);
        notifyListeners();
      }

}