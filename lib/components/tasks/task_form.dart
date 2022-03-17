import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';

import '../../data/tasksCollection.dart';

class TaskUpdate extends StatefulWidget {

  late Task task;
  final Function updateTask;

  State<TaskUpdate> createState() => _TaskUpdate();

  TaskUpdate(Task t, index, this.updateTask, {Key? key}) : super(key: key){
    task = t;
  }
}

class _TaskUpdate extends State<TaskUpdate> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: 150,
          color: Colors.white,
          child: Consumer<TasksCollection>(builder: (context, tasks, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Id ${widget.task.id}'),
                Text('Content : ${widget.task.content}'),
                Text('Completed : ${widget.task.completed}'),
                Text('Created At : ${widget.task.createdAt}'),
                const SizedBox(),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20, backgroundColor: Colors.white70),
                  ),
                  onPressed: () => {
                  },
                  child: const Text('Update'),
                )
              ],
            );
          })
      ),
    );
  }
}