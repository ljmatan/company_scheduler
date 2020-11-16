import 'package:company_scheduler/logic/api/task/task_details_model.dart';
import 'package:company_scheduler/ui/shared/task_priority_color.dart';
import 'package:flutter/material.dart';

class DayView extends StatelessWidget {
  final List<TaskDetails> taskList;

  DayView({@required this.taskList});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 16),
        for (var i = 0; i < 25; i++)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Text(
                        (i < 10 ? '0$i' : '$i') + ':00',
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8 - 20,
                height: 60,
                child: Stack(
                  children: [
                    Divider(
                      height: 0,
                      thickness: 2,
                    ),
                    if (taskList.isEmpty && i == 0)
                      Positioned(
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          height: 60,
                          child: Center(
                            child: Text('No tasks'),
                          ),
                        ),
                      )
                    else
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var task in taskList)
                            if (DateTime.fromMillisecondsSinceEpoch(
                                            task.startTime)
                                        .hour <=
                                    i &&
                                DateTime.fromMillisecondsSinceEpoch(
                                            task.endTime)
                                        .hour >
                                    i)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color:
                                        TaskPriorityColor.color(task.priority),
                                  ),
                                  child: SizedBox(
                                    width: ((MediaQuery.of(context).size.width *
                                                    0.8 -
                                                20) *
                                            0.9) /
                                        taskList.length,
                                    height: 60,
                                    child: i ==
                                            DateTime.fromMillisecondsSinceEpoch(
                                                    task.startTime)
                                                .hour
                                        ? Center(
                                            child: Flexible(
                                              child: Text(
                                                task.name,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        : null,
                                  ),
                                ),
                              )
                            else if (DateTime.fromMillisecondsSinceEpoch(
                                        task.startTime)
                                    .isAtSameMomentAs(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            task.endTime)) &&
                                i ==
                                    DateTime.fromMillisecondsSinceEpoch(
                                            task.startTime)
                                        .hour)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: SizedBox(
                                  width: ((MediaQuery.of(context).size.width *
                                                  0.8 -
                                              20) *
                                          0.9) /
                                      taskList.length,
                                  height: 60,
                                  child: Center(
                                    child: Flexible(
                                      child: Text(
                                        task.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: TaskPriorityColor.color(
                                            task.priority,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}
