import 'dart:async';
import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/logic/api/task/task_details_model.dart';
import 'package:company_scheduler/logic/calendar/calendar_provider.dart';
import 'package:company_scheduler/ui/calendar/appbar/appbar.dart';
import 'package:company_scheduler/ui/calendar/bloc/date_selection.dart';
import 'package:company_scheduler/ui/calendar/bloc/day_selection.dart';
import 'package:company_scheduler/ui/calendar/bloc/view.dart';
import 'package:company_scheduler/ui/calendar/day_view/day_view.dart';
import 'package:company_scheduler/ui/shared/custom_spinning_indicator.dart';
import 'package:company_scheduler/ui/shared/task_entry.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  final PageController _pageController = PageController(initialPage: 240);

  int _pageIndex = 240;
  DateTime _currentDate = DateTime.now();
  double _scrollValue = 240;

  @override
  void initState() {
    super.initState();
    DateSelection.init();
    DaySelection.init();
    CalendarView.init();
    _pageController.addListener(
      () {
        _scrollValue = _pageController.page;
        if (_pageController.page.round() != _pageIndex) {
          _pageIndex = _pageController.page.round();
          _currentDate = CalendarProvider.addMonths(
            DateTime.now(),
            _pageIndex - 240,
          );
          DateSelection.change(_currentDate);
        }
        if (_pageController.page % 1 == 0)
          DaySelection.change(
            DateTime(
              _currentDate.year,
              _currentDate.month,
              DaySelection.selected.day,
            ),
          );
      },
    );
  }

  Future<List> _getTasks() async => await TaskAPI.getTaskList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          kToolbarHeight + 24,
        ),
        child: CalendarAppBar(),
      ),
      body: FutureBuilder(
        future: _getTasks(),
        builder: (context, tasks) => tasks.hasData
            ? StreamBuilder(
                stream: CalendarView.stream,
                initialData: 'month',
                builder: (context, view) => view.data == 'month'
                    ? PageView.builder(
                        controller: _pageController,
                        itemCount: 481,
                        itemBuilder: (context, index) => ListView(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.1,
                                  color: Colors.black38,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  for (var row in CalendarProvider.weekRows(
                                    index == 240
                                        ? DateTime.now()
                                        : CalendarProvider.addMonths(
                                            DateTime.now(),
                                            index - 240,
                                          ),
                                    tasks.data,
                                    _pageController,
                                  ))
                                    row
                                ],
                              ),
                            ),
                            StreamBuilder(
                              stream: DaySelection.stream,
                              initialData: DaySelection.selected,
                              builder: (context, date) {
                                List<TaskDetails> _taskList =
                                    CalendarProvider.getTaskList(
                                  [
                                    for (var task in tasks.data)
                                      TaskDetails.fromJson(task),
                                  ],
                                  date.data,
                                );
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (_taskList.isEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 16),
                                        child: Text(
                                          'No tasks found',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      )
                                    else if (_scrollValue % 1 == 0)
                                      for (var task in _taskList)
                                        TaskEntry(task: task),
                                    const SizedBox(height: 16),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    : StreamBuilder(
                        stream: DaySelection.stream,
                        initialData: DaySelection.selected,
                        builder: (context, date) => WillPopScope(
                          child: PageView.builder(
                            itemBuilder: (context, i) {
                              List _taskList = CalendarProvider.getTaskList(
                                [
                                  TaskDetails(
                                    startTime: DateTime(2020, 10, 15, 8)
                                        .millisecondsSinceEpoch,
                                    endTime: DateTime(2020, 10, 15, 19)
                                        .millisecondsSinceEpoch,
                                    name: 'aaaaaaaa',
                                  ),
                                  for (var task in tasks.data)
                                    TaskDetails.fromJson(task),
                                ],
                                date.data,
                              );
                              _taskList.sort(
                                (a, b) => a.startTime.compareTo(b.startTime),
                              );
                              return DayView(
                                taskList: _taskList,
                              );
                            },
                          ),
                          onWillPop: () async {
                            CalendarView.change('month');
                            return false;
                          },
                        ),
                      ),
              )
            : Center(child: CustomSpinningIndicator()),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    CalendarView.dispose();
    DateSelection.dispose();
    DaySelection.dispose();
    super.dispose();
  }
}
