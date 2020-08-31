import 'package:flutter/material.dart';
import 'package:flutter_todoey/models/Task.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todoey/states/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  final Function addTask;
  final TextEditingController tec = TextEditingController();

  AddTaskScreen({this.addTask});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String task;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: Color(0xff757575),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Add Task', textAlign: TextAlign.center, style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 20.0
                  ),),
                  TextField(
                    controller: widget.tec,
                    onChanged: (value) {
                      task = value;
                    },
                    decoration: InputDecoration(
                        hintText: "Hello",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlueAccent),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlueAccent),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false).addTask(task);
                      widget.tec.clear();
                      Navigator.pop(context);
                    },
                    child: Text('Add', style: TextStyle(
                      color: Colors.white,
                    ),),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
