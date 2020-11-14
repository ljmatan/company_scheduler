import 'package:company_scheduler/ui/shared/task_entry.dart';
import 'package:flutter/material.dart';

class CurrentTasks extends StatefulWidget {
  final List<TaskEntry> tasks;

  CurrentTasks({@required this.tasks});

  @override
  State<StatefulWidget> createState() {
    return _CurrentTasksState();
  }
}

class _CurrentTasksState extends State<CurrentTasks>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.tasks.isNotEmpty
        ? ListView(
            children: [for (var task in widget.tasks) task],
          )
        : Center(
            child: Text(
              'No tasks found',
              textAlign: TextAlign.center,
            ),
          );
  }

  @override
  bool get wantKeepAlive => true;
}
