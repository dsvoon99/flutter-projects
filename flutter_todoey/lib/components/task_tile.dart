import 'package:flutter/material.dart';
import 'package:flutter_todoey/models/Task.dart';
import 'package:flutter_todoey/states/task_data.dart';
import 'package:provider/provider.dart';


class TaskTile extends StatefulWidget {
  int i;

  TaskTile({this.i});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    var task = Provider.of<TaskData>(context).tasks[widget.i];
    print(task);
    return GestureDetector(
      onLongPress: () {
        print('On Long pr');
        Provider.of<TaskData>(context, listen: false).deleteTask(widget.i);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(task.d,
          style: TextStyle(
            decoration: task.done ? TextDecoration.lineThrough: TextDecoration.none,
          ),),
          TickBox(checked: task.done , cb: (value) {
            Provider.of<TaskData>(context, listen: false).updateTask(value, widget.i);
          },)
        ],
      ),
    );;
  }
}

class TickBox extends StatelessWidget {
  final checked;
  Function cb;
  TickBox({this.checked, this.cb});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checked,
      onChanged: cb
    );
  }
}

