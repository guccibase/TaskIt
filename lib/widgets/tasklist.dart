import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function stateChange;

  TasksList({this.title, this.isChecked, this.stateChange});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(value: isChecked, onChanged: stateChange),
    );
  }
}
