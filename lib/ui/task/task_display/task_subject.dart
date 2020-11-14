import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/logic/api/task/task_subject_model.dart'
    as model;
import 'package:company_scheduler/ui/task/task_display/bloc/task_type_selection.dart';
import 'package:flutter/material.dart';
import 'package:company_scheduler/ui/shared/custom_spinning_indicator.dart';

class TaskSubject extends StatelessWidget {
  final String taskID;

  TaskSubject({@required this.taskID});

  Future<List> _getTaskSubjects(String type) async =>
      await TaskAPI.getTaskSubjectForTaskType(taskID, type);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: TaskTypeSelection.stream,
      builder: (context, type) => FutureBuilder(
        future:
            !type.hasData ? Future.value(null) : _getTaskSubjects(type.data),
        builder: (context, available) => Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'Subjects',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (!available.hasError &&
                  available.connectionState != ConnectionState.done)
                SizedBox(
                  height: 80,
                  child: Center(child: CustomSpinningIndicator(size: 40)),
                )
              else if (available.hasError)
                Text('Error: ' + available.error.toString())
              else if (available.hasData && available.data.isNotEmpty)
                for (var user in available.data)
                  Text('- ' + model.TaskSubject.fromJson(user).name)
              else if (available.hasData && available.data.isEmpty)
                Text('None')
              else if (!available.hasData)
                Text('Select a task type'),
            ],
          ),
        ),
      ),
    );
  }
}
