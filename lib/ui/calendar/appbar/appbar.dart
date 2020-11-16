import 'package:company_scheduler/ui/calendar/appbar/day_name.dart';
import 'package:company_scheduler/ui/calendar/bloc/date_selection.dart';
import 'package:company_scheduler/ui/calendar/bloc/day_selection.dart';
import 'package:company_scheduler/ui/calendar/bloc/view.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:company_scheduler/logic/i18n/i18n.dart';

class CalendarAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: kElevationToShadow[1],
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Platform.isAndroid
                              ? Icons.arrow_back
                              : Icons.arrow_back_ios,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      StreamBuilder(
                        stream: CalendarView.stream,
                        initialData: 'month',
                        builder: (context, view) => view.data == 'month'
                            ? StreamBuilder(
                                stream: DateSelection.stream,
                                initialData: DateTime.now(),
                                builder: (context, date) => Text(
                                  Internationalization.calendar(
                                        'months',
                                        date.data.month,
                                      ) +
                                      ' ' +
                                      date.data.year.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            : Builder(
                                builder: (context) => StreamBuilder(
                                  stream: DaySelection.stream,
                                  initialData: DaySelection.selected,
                                  builder: (context, date) => Text(
                                    date.data.day.toString() +
                                        '. ' +
                                        Internationalization.calendar(
                                          'months',
                                          date.data.month,
                                        ),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: DropdownButton(
                      hint: Text(
                        'View',
                        style: const TextStyle(color: Colors.black),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text('Month'),
                          value: 'month',
                        ),
                        DropdownMenuItem(
                          child: Text('Day'),
                          value: 'day',
                        ),
                      ],
                      onChanged: (value) => CalendarView.change(value),
                      underline: const SizedBox(),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: CalendarView.stream,
              initialData: 'month',
              builder: (context, view) => view.data == 'month'
                  ? Row(
                      children: [
                        for (var i = 1; i < 8; i++)
                          DayName(
                              day: Internationalization.calendar('days', i)),
                      ],
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
