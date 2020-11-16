import 'package:company_scheduler/logic/api/task/task_subject_model.dart';
import 'package:company_scheduler/ui/task/add_task/data.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/types_and_subjects/bloc/task_and_types_input.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/types_and_subjects/bloc/task_type_selection.dart';
import 'package:flutter/material.dart';

class SubjectEntry extends StatelessWidget {
  final TaskSubject subject;

  SubjectEntry({@required this.subject});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: TypeAndSubject.stream,
      builder: (context, selected) => FlatButton(
        color: selected.hasData && selected.data.split('+')[1] == subject.name
            ? Colors.green
            : Theme.of(context).primaryColor,
        child: Text(
          subject.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          NewTaskData.setType(TaskTypeSelection.value);
          NewTaskData.setSubject(subject.id);
          TypeAndSubject.update(
            TaskTypeSelection.type + '+' + subject.name,
          );
        },
      ),
    );
  }
}
