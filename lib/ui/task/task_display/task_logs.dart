import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/logic/api/task/task_log_model.dart';
import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/shared/custom_spinning_indicator.dart';
import 'package:flutter/material.dart';

class TaskLogs extends StatefulWidget {
  final String taskID;

  TaskLogs({@required this.taskID});

  @override
  State<StatefulWidget> createState() {
    return _TaskLogsState();
  }
}

class _TaskLogsState extends State<TaskLogs>
    with AutomaticKeepAliveClientMixin {
  Future<List> _getTaskLogs() async => TaskAPI.getTaskLogs(widget.taskID);

  DateTime _time(int time) => DateTime.fromMillisecondsSinceEpoch(time);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    super.build(context);
    return FutureBuilder(
      future: _getTaskLogs(),
      builder: (context, logs) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    Internationalization.task('logs'),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (!logs.hasData && !logs.hasError)
                  SizedBox(
                    height: 80,
                    child: Center(child: CustomSpinningIndicator(size: 40)),
                  )
                else if (logs.hasError)
                  Text(
                    Internationalization.misc('error') +
                        ': ' +
                        logs.error.toString(),
                  )
                else if (logs.hasData && logs.data.isNotEmpty)
                  for (var log in logs.data)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('- '),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: TaskLog.fromJson(log)
                                        .description
                                        .split('<br />')
                                        .first
                                        .split('<br/>')
                                        .first,
                                  ),
                                  TextSpan(
                                    text: '\n' +
                                        _time(TaskLog.fromJson(log).taskLogTime)
                                            .day
                                            .toString() +
                                        '.' +
                                        _time(TaskLog.fromJson(log).taskLogTime)
                                            .month
                                            .toString() +
                                        ' ' +
                                        (_time(TaskLog.fromJson(log).taskLogTime)
                                                    .hour <
                                                10
                                            ? '0' +
                                                _time(TaskLog.fromJson(log).taskLogTime)
                                                    .hour
                                                    .toString()
                                            : _time(TaskLog.fromJson(log).taskLogTime)
                                                .hour
                                                .toString()) +
                                        ':' +
                                        (_time(TaskLog.fromJson(log).taskLogTime)
                                                    .minute <
                                                10
                                            ? '0' +
                                                _time(TaskLog.fromJson(log)
                                                        .taskLogTime)
                                                    .minute
                                                    .toString()
                                            : _time(TaskLog.fromJson(log)
                                                    .taskLogTime)
                                                .minute
                                                .toString()) +
                                        'h',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                else if (logs.hasData && logs.data.isEmpty)
                  Text(Internationalization.task('none')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
