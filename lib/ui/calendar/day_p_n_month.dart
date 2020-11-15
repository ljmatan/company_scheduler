import 'package:company_scheduler/logic/api/task/task_details_model.dart';
import 'package:company_scheduler/logic/calendar/calendar_provider.dart';
import 'package:company_scheduler/ui/calendar/bloc/day_selection.dart';
import 'package:flutter/material.dart';

class DayPrevNextMonth extends StatefulWidget {
  final DateTime date;
  final List tasks;
  final bool previousMonth;
  final PageController pageController;

  DayPrevNextMonth({
    @required this.date,
    @required this.tasks,
    @required this.previousMonth,
    @required this.pageController,
  });

  @override
  State<StatefulWidget> createState() {
    return _DayPrevNextMonth();
  }
}

class _DayPrevNextMonth extends State<DayPrevNextMonth> {
  List<TaskDetails> _taskList;

  @override
  void initState() {
    super.initState();
    _taskList = CalendarProvider.getTaskList(
      widget.tasks,
      widget.date,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.1,
            color: Colors.black38,
          ),
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
                  widget.date.day.toString(),
                  style: const TextStyle(
                    color: Colors.black26,
                  ),
                ),
                if (_taskList.isNotEmpty)
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.grey.shade300),
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
      onTap: () async {
        widget.previousMonth
            ? await widget.pageController.previousPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear)
            : await widget.pageController.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear);
        DaySelection.change(widget.date);
      },
    );
  }
}
