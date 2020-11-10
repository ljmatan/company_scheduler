import 'package:company_scheduler/ui/task/task_entry.dart';
import 'package:flutter/material.dart';

class CompletedTasks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CompletedTasksState();
  }
}

class _CompletedTasksState extends State<CompletedTasks>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      children: [
        TaskEntry(
          subject: 'Critical Social Analysis',
          percent: 100,
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
