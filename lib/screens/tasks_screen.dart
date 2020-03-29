import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/models/task_data.dart';
import 'package:taskapp/screens/add_task_sheet.dart';
import 'package:taskapp/widgets/task_list_view.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddTaskSheet());
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          size: 40.0,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30.0, 70.0, 30.0, 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 60,
                    color: Colors.lightBlueAccent,
                  ),
                  radius: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'TaskIt',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  Provider.of<TaskData>(context).taskLength.toString() +
                      ' Tasks',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: TaskListVIew(
                task: Provider.of<TaskData>(context).tasks,
              ),
            ),
          )
        ],
      ),
    );
  }
}
