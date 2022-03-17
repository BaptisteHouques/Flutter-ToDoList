import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/data/tasks.dart' as data;
import 'package:todolist/data/tasksCollection.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AllTasks> createState() => _AllTasks();
}

class _AllTasks extends State<AllTasks> {

TaskMaster listMaster = TaskMaster(data.tasks);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Consumer<TasksCollection>(builder: (context, tasks, child) {
          return listMaster;
        })
      ),
    );
  }
}