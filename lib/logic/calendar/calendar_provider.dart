import 'dart:math' as math;
import 'package:company_scheduler/ui/calendar/day_current_month.dart';
import 'package:company_scheduler/ui/calendar/day_p_n_month.dart';
import 'package:flutter/widgets.dart' show Widget, Row;

class CalendarProvider {
  static List weekRows(DateTime selectedDate, List events) {
    List weekRows = [];
    final int month = selectedDate.month;
    final int year = selectedDate.year;
    final int firstInMonthday = DateTime(year, month).weekday;
    final int daysInMonth = month < 8
        ? month % 2 == 0 && month != 2
            ? 30
            : month == 2 && year % 4 != 0
                ? 28
                : month == 2 && year % 4 == 0
                    ? 29
                    : 31
        : month % 2 == 0
            ? 31
            : 30;
    for (int i = 0; i < 6; i++) {
      List<Widget> days = [];
      for (int dayNr = firstInMonthday + 7 * i;
          dayNr < firstInMonthday + 7 + 7 * i;
          dayNr++) {
        // Set to dayNr - 2 * firstInMonthday + 1 for sun - mon display
        final int day = dayNr - 2 * firstInMonthday + 2;
        final int inNextMonth = day - daysInMonth;
        final int indateDay = month < 8
            ? day +
                (month == 1
                    ? 31
                    : month == 3
                        ? year % 4 == 0
                            ? 29
                            : 28
                        : daysInMonth == 31
                            ? daysInMonth - 1
                            : month != 2
                                ? daysInMonth + 1
                                : year % 4 == 0
                                    ? daysInMonth + 2
                                    : daysInMonth + 3)
            : day +
                (daysInMonth == 31 && month == 8
                    ? 31
                    : daysInMonth == 31
                        ? daysInMonth - 1
                        : month != 2
                            ? daysInMonth + 1
                            : year % 4 == 0
                                ? daysInMonth + 2
                                : daysInMonth + 3);
        final int dateDay = day > daysInMonth ? inNextMonth : indateDay;
        days.add(
          day > 0 && day <= daysInMonth
              ? DayCurrentMonth(
                  day: day,
                  date: selectedDate,
                  events: events,
                )
              : DayPrevNextMonth(
                  dateDay: dateDay,
                  daysInMonth: daysInMonth,
                  day: day,
                ),
        );
      }
      weekRows.add(Row(children: days));
    }
    return weekRows;
  }

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

  static int _daysInMonth(int year, int month) {
    var result = _daysInMonthList[month];
    if (month == 2 && _isLeapYear(year)) result++;
    return result;
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
    var newDay = math.min(dt.day, _daysInMonth(newYear, newMonth));
    if (dt.isUtc) {
      return new DateTime.utc(newYear, newMonth, newDay, dt.hour, dt.minute,
          dt.second, dt.millisecond, dt.microsecond);
    } else {
      return new DateTime(newYear, newMonth, newDay, dt.hour, dt.minute,
          dt.second, dt.millisecond, dt.microsecond);
    }
  }
}
