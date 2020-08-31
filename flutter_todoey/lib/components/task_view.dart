import 'package:flutter/material.dart';
import 'package:flutter_todoey/components/task_tile.dart';
import 'package:flutter_todoey/models/Task.dart';
import 'package:flutter_todoey/states/task_data.dart';
import 'package:provider/provider.dart';

class TaskView extends StatefulWidget {
  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    var itemCount = Provider.of<TaskData>(context).getTaskLength;
    return itemCount > 0 ? ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return TaskTile(i: index);
      },
    ) : Text(
      'No task yet.',
      style: TextStyle(color: Colors.black),
    );
  }
}
