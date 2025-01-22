import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TaskItem.dart';

class CompletedTask extends StatefulWidget {
  String title;
  int index;
  String tContent;
  DateTime duoTo;
  CompletedTask(
      {required this.title,
      required this.index,
      required this.tContent,
      required this.duoTo});
  @override
  State<CompletedTask> createState() => _completedTaskState();
}

class _completedTaskState extends State<CompletedTask> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CheckboxListTile(
        autofocus: false,
        value: this.value,
        checkColor: Color.fromARGB(187, 205, 202, 202),
        onChanged: (bool? value) {
          setState(() {
            this.value = value!;
            TaskItem(
                taskTitle: widget.title,
                tContent: widget.tContent,
                duoTo: widget.duoTo,
                index: widget.index);
          });
        },
      ),
      title: Text(
        "${widget.title}",
        style: TextStyle(color: Color.fromARGB(187, 205, 202, 202)),
      ),
      onTap: () {},
    );
  }
}
