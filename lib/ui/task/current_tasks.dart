import 'package:company_scheduler/ui/task/task_entry.dart';
import 'package:flutter/material.dart';

class CurrentTasks extends StatefulWidget {
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
    return ListView(
      children: [
        TaskEntry(
          subject: 'Critical Social Analysis',
          percent: 97,
          startTime: DateTime.fromMillisecondsSinceEpoch(
            1600180674198,
          ),
          endTime: DateTime.fromMillisecondsSinceEpoch(
            1600180674198,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
