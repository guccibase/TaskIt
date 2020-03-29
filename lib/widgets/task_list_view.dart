import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/models/task_data.dart';
import 'package:taskapp/screens/tasks.dart';
import 'package:taskapp/widgets/tasklist.dart';

class TaskListVIew extends StatefulWidget {
  final List<Task> task;

  TaskListVIew({@required this.task});

  @override
  _TaskListVIewState createState() => _TaskListVIewState();
}

class _TaskListVIewState extends State<TaskListVIew> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(20.0, 70.0, 30.0, 30.0),
      itemCount: widget.task.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onLongPress: () {
            Provider.of<TaskData>(context, listen: false)
                .deleteTask(widget.task[index]);
          },
          child: TasksList(
            title: widget.task[index].task,
            isChecked: widget.task[index].done,
            stateChange: (state) {
              Provider.of<TaskData>(context, listen: false)
                  .taskState(widget.task[index]);
            },
          ),
        );
      },
    );
  }
}
