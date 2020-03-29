import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/models/task_data.dart';

class AddTaskSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskName;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 50.0),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskName = newText;
                print(newTaskName);
              },
            ),
            FlatButton(
                color: Colors.lightBlueAccent,
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  print(newTaskName);

                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskName);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
