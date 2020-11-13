import 'package:company_scheduler/logic/api/task/task_details_model.dart';
import 'package:company_scheduler/ui/calendar/bloc/day_selection.dart';
import 'package:flutter/material.dart';

class DayCurrentMonth extends StatefulWidget {
  final int day;
  final DateTime date;
  final List<TaskDetails> tasks;

  DayCurrentMonth({
    @required this.day,
    @required this.date,
    @required this.tasks,
  });

  @override
  State<StatefulWidget> createState() {
    return _DayCurrentMonthState();
  }
}

class _DayCurrentMonthState extends State<DayCurrentMonth> {
  List<TaskDetails> _taskList = <TaskDetails>[];
  Color _color;

  @override
  void initState() {
    super.initState();

    for (var task in widget.tasks) {
      DateTime startTime;
      if (task.startTime != null)
        startTime = DateTime.fromMillisecondsSinceEpoch(task.startTime);
      DateTime endTime;
      if (task.endTime != null)
        endTime = DateTime.fromMillisecondsSinceEpoch(task.endTime);
      final DateTime currentDate =
          DateTime(widget.date.year, widget.date.month, widget.day);

      if (startTime != null &&
          endTime != null &&
          (startTime.compareTo(currentDate) <= 0 &&
                  startTime.month == currentDate.month &&
                  startTime.year == currentDate.year ||
              startTime.year == currentDate.year &&
                  startTime.month == currentDate.month &&
                  startTime.day == widget.day) &&
          (endTime.compareTo(currentDate) >= 0 &&
                  endTime.month == currentDate.month &&
                  endTime.year == currentDate.year ||
              endTime.year == endTime.year &&
                  endTime.month == endTime.month &&
                  endTime.day == widget.day)) {
        _taskList.add(task);
      }
    }

    int _highestPriority;
    if (_taskList.isNotEmpty)
      _taskList.forEach(
        (task) {
          if (_highestPriority == null && task.priority != null ||
              task.priority != null && task.priority > _highestPriority)
            _highestPriority = task.priority;
        },
      );
    _color = _highestPriority == 0
        ? Colors.green.shade300
        : _highestPriority == 3
            ? Colors.amber.shade300
            : _highestPriority == 6
                ? Colors.red.shade300
                : _highestPriority == 10
                    ? Colors.black
                    : Colors.grey.shade300;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DaySelection.stream,
      initialData: DaySelection.selected,
      builder: (context, selected) => InkWell(
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.1,
              color: Colors.black38,
            ),
            color:
                selected.data.day == widget.day ? Colors.grey.shade200 : null,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 7,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.day.toString(),
                    style: TextStyle(
                      color: widget.day == DateTime.now().day &&
                              widget.date.month == DateTime.now().month &&
                              widget.date.year == DateTime.now().year
                          ? Theme.of(context).primaryColor
                          : Colors.black54,
                    ),
                  ),
                  if (_taskList.isNotEmpty)
                    DecoratedBox(
                      decoration: BoxDecoration(color: _color),
                      child: SizedBox(
                        height: 18,
                        width: 18,
                        child: Center(
                          child: Text(
                            _taskList.length.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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
        onTap: selected.data.day == widget.day
            ? null
            : () => DaySelection.change(
                  DateTime(
                    widget.date.year,
                    widget.date.month,
                    widget.day,
                  ),
                ),
      ),
    );
  }
}
