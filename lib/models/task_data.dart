import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:taskapp/screens/tasks.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(task: 'Task 1'),
    Task(task: 'Task 2'),
    Task(task: 'Task 3'),
  ];

  int get taskLength {
    return _tasks.length;
  }

  void addTask(String newTask) {
    final task = Task(task: newTask);
    _tasks.add(task);
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void taskState(Task task) {
    task.isDone();
    notifyListeners();
  }

  void deleteTask(Task newTask) {
    _tasks.remove(newTask);
    notifyListeners();
  }
}
