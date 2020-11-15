import 'package:company_scheduler/logic/api/task/task_details_model.dart';
import 'package:flutter/material.dart';

class TaskTypeAndSubject extends StatelessWidget {
  final TaskDetails task;

  TaskTypeAndSubject({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          (task.type == null
                  ? ''
                  : task.type.name + (task.subject == null ? '' : ' - ')) +
              (task.subject == null ? '' : task.subject.name),
        ),
      ),
    );
  }
}
