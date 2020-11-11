import 'dart:async';
import 'package:company_scheduler/logic/calendar/calendar_provider.dart';
import 'package:company_scheduler/ui/calendar/appbar/appbar.dart';
import 'package:company_scheduler/ui/calendar/bloc/date_selection.dart';
import 'package:company_scheduler/ui/calendar/bloc/day_selection.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  final PageController _pageController = PageController(initialPage: 241);

  int _pageIndex = 241;
  DateTime _currentDate = DateTime.now();

  StreamSubscription _dateSubscription;

  @override
  void initState() {
    super.initState();
    DateSelection.init();
    DaySelection.init();
    _dateSubscription = DateSelection.stream.listen(
      (date) {},
    );
    _pageController.addListener(
      () {
        if (_pageController.page.round() != _pageIndex) {
          _pageIndex = _pageController.page.round();
          _currentDate = CalendarProvider.addMonths(
            DateTime.now(),
            _pageIndex - 241,
          );
          DateSelection.change(_currentDate);
        }
      },
    );
  }

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
      body: PageView.builder(
        controller: _pageController,
        itemCount: 481,
        itemBuilder: (context, index) => FutureBuilder(
          future: Future.delayed(
            const Duration(seconds: 0),
            () => [],
          ),
          builder: (context, tasks) => tasks.hasData
              ? ListView(
                  children: [
                    for (var row in CalendarProvider.weekRows(
                      index == 241
                          ? DateTime.now()
                          : CalendarProvider.addMonths(
                              DateTime.now(),
                              index - 241,
                            ),
                      tasks.data,
                    ))
                      row,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (tasks.data.isEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              'No tasks found',
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                )
              : SizedBox(
                  height:
                      MediaQuery.of(context).size.height - kToolbarHeight - 24,
                  child: Center(
                    child: SizedBox(
                      height: 64,
                      width: 64,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dateSubscription.cancel();
    DateSelection.dispose();
    DaySelection.dispose();
    super.dispose();
  }
}
