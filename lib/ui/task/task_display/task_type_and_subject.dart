import 'package:company_scheduler/logic/api/task/task_details_model.dart';
import 'package:flutter/material.dart';

class TaskTypeAndSubject extends StatefulWidget {
  final TaskDetails task;

  TaskTypeAndSubject({@required this.task});

  @override
  State<StatefulWidget> createState() {
    return _TaskTypeAndSubjectState();
  }
}

class _TaskTypeAndSubjectState extends State<TaskTypeAndSubject> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          widget.task.type.name + ' - ' + widget.task.subject.name,
        ),
      ),
    );
  }
}
