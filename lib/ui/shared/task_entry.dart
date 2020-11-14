import 'package:company_scheduler/logic/api/task/task_details_model.dart';
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
    final Color taskColor = task.priority == 0
        ? Colors.green.shade300
        : task.priority == 3
            ? Colors.amber.shade300
            : task.priority == 6
                ? Colors.red.shade300
                : task.priority == 10
                    ? Colors.black
                    : Colors.grey.shade300;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: InkWell(
        child: Ink(
          decoration: BoxDecoration(
            boxShadow: kElevationToShadow[1],
            color: Colors.white,
          ),
          child: SizedBox(
            height: 56,
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.black54),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 6, color: taskColor),
                      ),
                    ),
                    child: Padding(
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
                          Text(
                            task.project.projectType.name == null
                                ? ''
                                : task.project.projectType.name.toString(),
                          ),
                        ],
                      ),
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
                        Text(
                          startTime != null && endTime != null
                              ? (startTime.day < 10
                                      ? '0' + startTime.day.toString()
                                      : startTime.day.toString()) +
                                  '/' +
                                  (startTime.month < 10
                                      ? '0' + startTime.month.toString()
                                      : startTime.month.toString()) +
                                  ' - ' +
                                  (endTime.day < 10
                                      ? '0' + endTime.day.toString()
                                      : endTime.day.toString()) +
                                  '/' +
                                  (endTime.month < 10
                                      ? '0' + endTime.month.toString()
                                      : endTime.month.toString())
                              : '',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () => null,
      ),
    );
  }
}
