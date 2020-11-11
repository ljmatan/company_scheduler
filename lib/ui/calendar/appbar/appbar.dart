import 'package:company_scheduler/ui/calendar/appbar/day_name.dart';
import 'package:company_scheduler/ui/calendar/bloc/date_selection.dart';
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
                      stream: DateSelection.stream,
                      initialData: DateTime.now(),
                      builder: (context, date) => GestureDetector(
                        child: Text(
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
                        onTap: () => null,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ],
            ),
          ),
          Row(
            children: [
              for (var i = 1; i < 8; i++)
                DayName(day: Internationalization.calendar('days', i)),
            ],
          ),
        ],
      ),
    );
  }
}
