import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:todolist/data/tasks.dart' as data;
import 'package:flutter/material.dart';
import '../models/task.dart';

class TasksCollection extends ChangeNotifier {
  final List<Task> _tasks = data.tasks;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void remove(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void update(Task task) {
    var index = _tasks.indexOf(task);
    _tasks[index] = task;
    notifyListeners();
  }

  void removeAll() {
    _tasks.clear();
    notifyListeners();
  }

}