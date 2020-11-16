import 'dart:math' as math;
import 'package:company_scheduler/logic/api/task/task_details_model.dart';
import 'package:company_scheduler/ui/calendar/day_current_month.dart';
import 'package:company_scheduler/ui/calendar/day_p_n_month.dart';
import 'package:flutter/widgets.dart' show Widget, Row, PageController;

class CalendarProvider {
  static const _daysInMonthList = const [
    0,
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

  static bool _isLeapYear(int value) =>
      value % 400 == 0 || (value % 4 == 0 && value % 100 != 0);

  static int daysInMonth(int year, int month) {
    var result = _daysInMonthList[month];
    if (month == 2 && _isLeapYear(year)) result++;
    return result;
  }

  static List weekRows(
    DateTime selectedDate,
    List tasks,
    PageController pageController,
  ) {
    List weekRows = [];

    final int month = selectedDate.month;
    final int year = selectedDate.year;
    final int firstInMonthday = DateTime(year, month).weekday;
    final int daysInThisMonth = daysInMonth(year, month);

    for (int i = 0; i < 6; i++) {
      List<Widget> days = [];

      for (int dayNr = firstInMonthday + 7 * i;
          dayNr < firstInMonthday + 7 + 7 * i;
          dayNr++) {
        // Set below to dayNr - 2 * firstInMonthday + 1 for sun - mon display
        final int day = dayNr - 2 * firstInMonthday + 2;
        final int inNextMonth = day - daysInThisMonth;
        final int inDateDay = month < 8
            ? day +
                (month == 1
                    ? 31
                    : month == 3
                        ? year % 4 == 0
                            ? 29
                            : 28
                        : daysInThisMonth == 31
                            ? daysInThisMonth - 1
                            : month != 2
                                ? daysInThisMonth + 1
                                : year % 4 == 0
                                    ? daysInThisMonth + 2
                                    : daysInThisMonth + 3)
            : day +
                (daysInThisMonth == 31 && month == 8
                    ? 31
                    : daysInThisMonth == 31
                        ? daysInThisMonth - 1
                        : month != 2
                            ? daysInThisMonth + 1
                            : year % 4 == 0
                                ? daysInThisMonth + 2
                                : daysInThisMonth + 3);

        final bool _inNextMonth = day > daysInThisMonth;

        final int dateDay = _inNextMonth ? inNextMonth : inDateDay;

        days.add(
          day > 0 && day <= daysInThisMonth
              ? DayCurrentMonth(
                  day: day,
                  date: selectedDate,
                  tasks: [for (var task in tasks) TaskDetails.fromJson(task)],
                )
              : DayPrevNextMonth(
                  date: DateTime(
                    addMonths(selectedDate, _inNextMonth ? 1 : -1).year,
                    addMonths(selectedDate, _inNextMonth ? 1 : -1).month,
                    dateDay,
                  ),
                  tasks: [for (var task in tasks) TaskDetails.fromJson(task)],
                  previousMonth: !_inNextMonth,
                  pageController: pageController,
                ),
        );
      }
      weekRows.add(Row(children: days));
    }
    return weekRows;
  }

  static DateTime addMonths(DateTime dt, int value) {
    var r = value % 12;
    var q = (value - r) ~/ 12;
    var newYear = dt.year + q;
    var newMonth = dt.month + r;
    if (newMonth > 12) {
      newYear++;
      newMonth -= 12;
    }
    var newDay = math.min(dt.day, daysInMonth(newYear, newMonth));
    if (dt.isUtc) {
      return new DateTime.utc(newYear, newMonth, newDay, dt.hour, dt.minute,
          dt.second, dt.millisecond, dt.microsecond);
    } else {
      return new DateTime(newYear, newMonth, newDay, dt.hour, dt.minute,
          dt.second, dt.millisecond, dt.microsecond);
    }
  }

  static List<TaskDetails> getTaskList(
    List tasks,
    DateTime currentDate,
  ) {
    List<TaskDetails> _taskList = <TaskDetails>[];
    for (var task in tasks) {
      DateTime startTime;
      if (task.startTime != null)
        startTime = DateTime.fromMillisecondsSinceEpoch(task.startTime);
      DateTime endTime;
      if (task.endTime != null)
        endTime = DateTime.fromMillisecondsSinceEpoch(task.endTime);
      if (startTime != null &&
          endTime != null &&
          (startTime.compareTo(currentDate) <= 0 &&
                  startTime.month == currentDate.month &&
                  startTime.year == currentDate.year ||
              startTime.year == currentDate.year &&
                  startTime.month == currentDate.month &&
                  startTime.day == currentDate.day) &&
          (endTime.compareTo(currentDate) >= 0 &&
                  endTime.month == currentDate.month &&
                  endTime.year == currentDate.year ||
              endTime.year == endTime.year &&
                  endTime.month == endTime.month &&
                  endTime.day == currentDate.day)) _taskList.add(task);
    }
    return _taskList;
  }
}
