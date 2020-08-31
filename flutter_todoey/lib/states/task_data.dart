import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_todoey/models/Task.dart';

class TaskData extends ChangeNotifier{
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get getTaskLength {
    return _tasks.length;
  }

  void addTask(String d) {
    if(d.trim().length > 0) {
      _tasks.add(Task(d: d));
      notifyListeners();
    }
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    print('Delete task at $index');
    notifyListeners();
  }

  void updateTask(bool newValue, int index) {
    print('$newValue $index');
    _tasks[index].updateDone(newValue);
    notifyListeners();
  }

}