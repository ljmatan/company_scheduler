import 'package:company_scheduler/logic/api/task/task_subject_model.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/types_and_subjects/bloc/task_and_types_input.dart';
import 'package:company_scheduler/ui/task/add_task/info_entry/types_and_subjects/bloc/task_type_selection.dart';
import 'package:flutter/material.dart';

class SubjectEntry extends StatefulWidget {
  final TaskSubject subject;

  SubjectEntry({@required this.subject});

  @override
  State<StatefulWidget> createState() {
    return _SubjectEntryState();
  }
}

class _SubjectEntryState extends State<SubjectEntry> {
  bool _added = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: _added ? Colors.green : Theme.of(context).primaryColor,
      child: Text(
        widget.subject.name,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () async {
        setState(() => _added = !_added);
        if (_added) {
          print(TaskAndTypesInput.list);
          print(TaskAndTypesInput.list[TaskTypeSelection.type]);
          TaskAndTypesInput.list[TaskTypeSelection.type]
              .putIfAbsent(widget.subject.name, () => widget.subject);
          print(TaskAndTypesInput.list[TaskTypeSelection.type]
              [widget.subject.name]);
        }
      },
    );
  }
}
