import 'package:company_scheduler/ui/task/task_display/task_time/from_to_time.dart';
import 'package:flutter/material.dart';

class TaskTime extends StatelessWidget {
  final DateTime startTime, endTime;

  TaskTime({@required this.startTime, @required this.endTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FromToTime(time: startTime, label: 'from'),
          FromToTime(time: endTime, label: 'to'),
        ],
      ),
    );
  }
}
