import 'package:company_scheduler/ui/calendar/day_current_month.dart';
import 'package:company_scheduler/ui/calendar/day_p_n_month.dart';
import 'package:company_scheduler/ui/calendar/week_row.dart';
import 'package:flutter/widgets.dart' show Widget;

class CalendarProvider {
  static List weekRows(DateTime streamDate, List events) {
    List weekRows = [];
    DateTime date = streamDate;
    int month = date.month;
    int year = date.year;
    int firstInMonthdayOfTheWeek = DateTime(year, month).weekday;
    int daysInMonth = month < 8
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
        int dayOfTheWeek = dayOfTheWeekNr - 2 * firstInMonthdayOfTheWeek + 1;
        int inNextMonth = dayOfTheWeek - daysInMonth;
        int indateDay = month < 8
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
        int dateDay = dayOfTheWeek > daysInMonth ? inNextMonth : indateDay;
        dayOfTheWeeks.add(
          dayOfTheWeek > 0 && dayOfTheWeek <= daysInMonth
              ? DayCurrentMonth(
                  dayOfTheWeek: dayOfTheWeek,
                  date: date,
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
