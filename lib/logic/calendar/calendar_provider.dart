import 'package:company_scheduler/ui/calendar/day_current_month.dart';
import 'package:company_scheduler/ui/calendar/day_p_n_month.dart';
import 'package:company_scheduler/ui/calendar/week_row.dart';
import 'package:flutter/widgets.dart' show Widget;

class CalendarProvider {
  static List weekRows(DateTime selectedDate, List events) {
    List weekRows = [];
    final int month = selectedDate.month;
    final int year = selectedDate.year;
    final int firstInMonthdayOfTheWeek = DateTime(year, month).weekday;
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
      List<Widget> dayOfTheWeeks = [];
      for (int dayOfTheWeekNr = firstInMonthdayOfTheWeek + 7 * i;
          dayOfTheWeekNr < firstInMonthdayOfTheWeek + 7 + 7 * i;
          dayOfTheWeekNr++) {
        // Set to dayOfTheWeekNr - 2 * firstInMonthdayOfTheWeek + 1 for sun - mon display
        final int dayOfTheWeek =
            dayOfTheWeekNr - 2 * firstInMonthdayOfTheWeek + 2;
        final int inNextMonth = dayOfTheWeek - daysInMonth;
        final int indateDay = month < 8
            ? dayOfTheWeek +
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
            : dayOfTheWeek +
                (daysInMonth == 31 && month == 8
                    ? 31
                    : daysInMonth == 31
                        ? daysInMonth - 1
                        : month != 2
                            ? daysInMonth + 1
                            : year % 4 == 0
                                ? daysInMonth + 2
                                : daysInMonth + 3);
        final int dateDay =
            dayOfTheWeek > daysInMonth ? inNextMonth : indateDay;
        dayOfTheWeeks.add(
          dayOfTheWeek > 0 && dayOfTheWeek <= daysInMonth
              ? DayCurrentMonth(
                  dayOfTheWeek: dayOfTheWeek,
                  date: selectedDate,
                  events: events,
                )
              : DayPrevNextMonth(
                  dateDay: dateDay,
                  daysInMonth: daysInMonth,
                  dayOfTheWeek: dayOfTheWeek,
                ),
        );
      }
      weekRows.add(WeekRow(children: dayOfTheWeeks));
    }
    return weekRows;
  }
}
