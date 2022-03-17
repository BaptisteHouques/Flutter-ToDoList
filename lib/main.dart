import 'package:flutter/material.dart';
import 'package:todolist/screens/all_tasks.dart';
import 'package:provider/provider.dart';
import 'data/tasksCollection.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TasksCollection(),
      child: const TodoList()
    ),
  );
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Roboto',
      ),
      home: const AllTasks(title: 'Flutter Demo Home Page'),
    );
  }
}
