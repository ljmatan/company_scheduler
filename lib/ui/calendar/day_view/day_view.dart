import 'dart:async';

import 'package:company_scheduler/logic/api/task/task_details_model.dart';
import 'package:company_scheduler/ui/shared/task_priority_color.dart';
import 'package:flutter/material.dart';

class DayView extends StatefulWidget {
  final List<TaskDetails> taskList;

  DayView({@required this.taskList});

  @override
  State<StatefulWidget> createState() {
    return _DayViewState();
  }
}

class _DayViewState extends State<DayView> {
  final ScrollController _scrollController = ScrollController();
  final StreamController<double> _streamController =
      StreamController<double>.broadcast();

  @override
  void initState() {
    super.initState();
    _scrollController
        .addListener(() => _streamController.add(_scrollController.offset));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.taskList.isNotEmpty)
          Positioned(
            left: MediaQuery.of(context).size.width * 0.2,
            right: 20,
            top: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var task in widget.taskList)
                  SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.8 - 20) /
                        widget.taskList.length,
                    child: StreamBuilder(
                      stream: _streamController.stream,
                      initialData: 0.0,
                      builder: (context, offset) => Transform.translate(
                        offset: Offset(0, -offset.data),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 60 *
                                    (DateTime.fromMillisecondsSinceEpoch(
                                                task.startTime)
                                            .hour)
                                        .toDouble(),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: DateTime.fromMillisecondsSinceEpoch(
                                                task.startTime)
                                            .isAtSameMomentAs(DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    task.endTime))
                                        ? null
                                        : TaskPriorityColor.color(
                                            task.priority,
                                          ),
                                  ),
                                  child: SizedBox(
                                    height: DateTime.fromMillisecondsSinceEpoch(
                                                task.startTime)
                                            .isAtSameMomentAs(DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    task.endTime))
                                        ? 60
                                        : 60 *
                                            (DateTime.fromMillisecondsSinceEpoch(
                                                        task.endTime)
                                                    .difference(DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            task.startTime))
                                                    .inHours)
                                                .toDouble(),
                                    width: MediaQuery.of(context).size.width,
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        task.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          task.startTime)
                                                  .isAtSameMomentAs(DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          task.endTime))
                                              ? TaskPriorityColor.color(
                                                  task.priority,
                                                )
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ListView(
          controller: _scrollController,
          children: [
            const SizedBox(height: 16),
            for (var i = 0; i < 24; i++)
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
                        if (widget.taskList.isEmpty && i == 0)
                          Positioned(
                            left: 0,
                            right: 0,
                            child: SizedBox(
                              height: 60,
                              child: Center(
                                child: Text('No tasks'),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _streamController.close();
    super.dispose();
  }
}
