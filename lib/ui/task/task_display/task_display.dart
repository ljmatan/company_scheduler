import 'package:company_scheduler/logic/api/task/task_details_model.dart';
import 'package:company_scheduler/ui/shared/task_priority_color.dart';
import 'package:company_scheduler/ui/task/task_display/bloc/task_type_selection.dart';
import 'package:company_scheduler/ui/task/task_display/principal_list.dart';
import 'package:company_scheduler/ui/task/task_display/task_comments/task_comments.dart';
import 'package:company_scheduler/ui/task/task_display/task_description.dart';
import 'package:company_scheduler/ui/task/task_display/task_subject.dart';
import 'package:company_scheduler/ui/task/task_display/task_time/task_time.dart';
import 'package:company_scheduler/ui/task/task_display/task_types.dart';
import 'package:flutter/material.dart';

class TaskDisplay extends StatefulWidget {
  final TaskDetails task;

  TaskDisplay({@required this.task});
  @override
  State<StatefulWidget> createState() {
    return _TaskDisplayState();
  }
}

class _TaskDisplayState extends State<TaskDisplay> {
  DateTime startTime, endTime;

  @override
  void initState() {
    super.initState();
    TaskTypeSelection.init();
    if (widget.task.startTime != null)
      startTime = DateTime.fromMillisecondsSinceEpoch(
        widget.task.startTime,
      );
    if (widget.task.endTime != null)
      endTime = DateTime.fromMillisecondsSinceEpoch(
        widget.task.endTime,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: TaskPriorityColor.color(widget.task.priority),
                ),
                child: SizedBox(height: 10, width: 10),
              ),
            ),
            Text(widget.task.name),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: ListView(
        children: [
          TaskDescription(description: widget.task.description),
          TaskTypes(taskID: widget.task.id.toString()),
          TaskSubject(taskID: widget.task.id.toString()),
          PrincipalList(taskID: widget.task.id.toString()),
          if (startTime != null && endTime != null)
            TaskTime(
              startTime: startTime,
              endTime: endTime,
            ),
          TaskComments(taskID: widget.task.id.toString()),
        ],
      ),
    );
  }

  @override
  void dispose() {
    TaskTypeSelection.dispose();
    super.dispose();
  }
}
