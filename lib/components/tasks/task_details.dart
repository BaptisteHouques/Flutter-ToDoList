import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/data/tasksCollection.dart';
import 'package:provider/provider.dart';

class TaskDetails extends StatefulWidget {

  late Task task;
  final Function hideDetails;
  final Function deleteTask;
  final Function showFormTask;
  final int index;

  State<TaskDetails> createState() => _TaskDetails();

  TaskDetails(Task t, this.hideDetails, this.index, this.deleteTask, this.showFormTask, {Key? key}) : super(key: key){
    task = t;
  }
}

class _TaskDetails extends State<TaskDetails> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {widget.hideDetails(widget.index);},
      child: Container(
          height: 150,
          color: widget.task.completed? Colors.green : Colors.red,
          child: Consumer<TasksCollection>(builder: (context, tasks, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Id ${widget.task.id}'),
                Text('Content : ${widget.task.content}'),
                Text('Completed : ${widget.task.completed}'),
                Text('Created At : ${widget.task.createdAt}'),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children : [
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20, backgroundColor: Colors.white70),
                        ),
                        onPressed: () => {
                          widget.deleteTask(widget.task),
                          widget.hideDetails(widget.index)
                        },
                        child: const Text('Delete'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20, backgroundColor: Colors.white70),
                        ),
                        onPressed: () => {
                          widget.showFormTask
                        },
                        child: const Text('Update'),
                      )
                    ]
                )
              ],
            );
          })
      ),
    );
  }
}