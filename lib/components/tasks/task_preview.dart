import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TaskPreview extends StatefulWidget {

  late Task task;
  final Function showDetails;
  final int index;

  State<TaskPreview> createState() => _TaskPreview();

  TaskPreview(Task t, this.showDetails, this.index, {Key? key}) : super(key: key){
    task = t;
  }

}

class _TaskPreview extends State<TaskPreview> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {widget.showDetails(widget.index);},
      child: Container(
          height: 50,
          color: widget.task.completed? Colors.green : Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible( child : Text(widget.task.content)),
              Flexible( child : Text(widget.task.completed ? "completed" : " to do "))
            ],
          )
      ),
    );
  }
}
