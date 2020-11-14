import 'dart:async';
import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/logic/api/task/task_details_model.dart';
import 'package:company_scheduler/logic/calendar/calendar_provider.dart';
import 'package:company_scheduler/ui/calendar/appbar/appbar.dart';
import 'package:company_scheduler/ui/calendar/bloc/date_selection.dart';
import 'package:company_scheduler/ui/calendar/bloc/day_selection.dart';
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

  @override
  void initState() {
    super.initState();
    DateSelection.init();
    DaySelection.init();
    _pageController.addListener(
      () {
        if (_pageController.page.round() != _pageIndex) {
          _pageIndex = _pageController.page.round();
          _currentDate = CalendarProvider.addMonths(
            DateTime.now(),
            _pageIndex - 240,
          );
          DateSelection.change(_currentDate);
          DaySelection.change(
            DateTime(
              _currentDate.year,
              _currentDate.month,
              DaySelection.selected.day,
            ),
          );
        }
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
      endDrawerEnableOpenDragGesture: false,
      endDrawer: Drawer(),
      body: FutureBuilder(
        future: _getTasks(),
        builder: (context, tasks) => tasks.hasData
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
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              )
                            else
                              for (var task in _taskList) TaskEntry(task: task),
                            const SizedBox(height: 16),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              )
            : Center(child: CustomSpinningIndicator()),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    DateSelection.dispose();
    DaySelection.dispose();
    super.dispose();
  }
}
