import 'package:company_scheduler/logic/api/task/task_details_model.dart';
import 'package:flutter/material.dart';

class DayView extends StatelessWidget {
  final List<TaskDetails> taskList;

  DayView({@required this.taskList});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          (i < 10 ? '0$i' : '$i') + ':00',
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Divider(
                        height: 26,
                        thickness: 2,
                        endIndent: 20,
                      ),
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
                    else if (taskList.contains((e) =>
                        DateTime.fromMillisecondsSinceEpoch(e.startTime).hour <=
                            i ||
                        DateTime.fromMillisecondsSinceEpoch(e.endTime).hour >=
                            i))
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.green,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 60,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}
