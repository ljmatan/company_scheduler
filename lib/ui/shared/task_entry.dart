import 'package:company_scheduler/logic/api/task/task_details_model.dart';
import 'package:company_scheduler/ui/shared/task_priority_color.dart';
import 'package:company_scheduler/ui/task/task_display/task_display.dart';
import 'package:flutter/material.dart';

class TaskEntry extends StatelessWidget {
  final TaskDetails task;

  TaskEntry({@required this.task});

  @override
  Widget build(BuildContext context) {
    final DateTime startTime = task.startTime != null
        ? DateTime.fromMillisecondsSinceEpoch(
            task.startTime,
          )
        : null;
    final DateTime endTime = task.endTime != null
        ? DateTime.fromMillisecondsSinceEpoch(
            task.endTime,
          )
        : null;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: InkWell(
        child: Ink(
          decoration: BoxDecoration(
            boxShadow: kElevationToShadow[1],
            color: Colors.white,
          ),
          child: DefaultTextStyle(
            style: const TextStyle(color: Colors.black54),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 6,
                    color: TaskPriorityColor.color(task.priority),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 6, 0, 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          task.name == null ? '' : task.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            '\n' +
                                (task.project.projectType.name == null
                                    ? ''
                                    : task.project.projectType.name.toString()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 6, 6, 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(task.percent == null
                            ? ''
                            : (task.percent.toString() + '%')),
                        if (startTime != null && endTime != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  (startTime.day < 10
                                          ? '0' + startTime.day.toString()
                                          : startTime.day.toString()) +
                                      '/' +
                                      (startTime.month < 10
                                          ? '0' + startTime.month.toString()
                                          : startTime.month.toString()) +
                                      ' ' +
                                      (startTime.hour < 10
                                          ? '0' + startTime.hour.toString()
                                          : startTime.hour.toString()) +
                                      ':' +
                                      (startTime.minute < 10
                                          ? '0' + startTime.minute.toString()
                                          : startTime.minute.toString()),
                                ),
                                Text(
                                  (endTime.day < 10
                                          ? '0' + endTime.day.toString()
                                          : endTime.day.toString()) +
                                      '/' +
                                      (endTime.month < 10
                                          ? '0' + endTime.month.toString()
                                          : endTime.month.toString()) +
                                      ' ' +
                                      (endTime.hour < 10
                                          ? '0' + endTime.hour.toString()
                                          : endTime.hour.toString()) +
                                      ':' +
                                      (endTime.minute < 10
                                          ? '0' + endTime.minute.toString()
                                          : endTime.minute.toString()),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => TaskDisplay(
              task: task,
            ),
          ),
        ),
      ),
    );
  }
}
