import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/logic/api/task/task_subject_model.dart'
    as model;
import 'package:company_scheduler/ui/task/task_display/bloc/task_type_selection.dart';
import 'package:flutter/material.dart';
import 'package:company_scheduler/ui/shared/custom_spinning_indicator.dart';

class TaskSubject extends StatefulWidget {
  final String taskID;

  TaskSubject({@required this.taskID});
  @override
  State<StatefulWidget> createState() {
    return _TaskSubjectState();
  }
}

class _TaskSubjectState extends State<TaskSubject>
    with AutomaticKeepAliveClientMixin {
  Future<List> _getTaskSubjects(String type) async =>
      await TaskAPI.getTaskSubjectForTaskType(widget.taskID, type);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder(
      stream: TaskTypeSelection.stream,
      builder: (context, type) => FutureBuilder(
        future:
            !type.hasData ? Future.value(null) : _getTaskSubjects(type.data),
        builder: (context, available) => Card(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Padding(
            padding: const EdgeInsets.all(9),
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
