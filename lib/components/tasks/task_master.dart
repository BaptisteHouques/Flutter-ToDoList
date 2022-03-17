import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/components/tasks/task_details.dart';
import 'package:todolist/components/tasks/task_form.dart';
import 'package:todolist/models/task.dart';

class TaskMaster extends StatefulWidget {

  late List<Task> tasks;

  State<TaskMaster> createState() => _TaskMaster();

  TaskMaster(List<Task> t, {Key? key}) : super(key: key){
    tasks = t;
  }

}

class _TaskMaster extends State<TaskMaster> {
  int actualId = -1;
  bool updateForm = false;

  void showTaskDetails(int index) {
    setState(() {
      if(index == actualId) {
        actualId = -1;
      }
      else {
        actualId = index;
      }
    });
  }

  void deleteTask(Task task) {
    setState(() {
      widget.tasks.remove(task) ;
    });
  }

  void showFormTask() {
    setState(() {
      updateForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: widget.tasks.length,
      itemBuilder: (BuildContext context, int index) {
        if(index == actualId){
          return TaskDetails(widget.tasks[index], showTaskDetails, index, deleteTask, showFormTask);
        }
        else {
          return TaskPreview(widget.tasks[index], showTaskDetails, index);
        }
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

}