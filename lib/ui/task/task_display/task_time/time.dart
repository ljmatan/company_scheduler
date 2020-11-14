import 'package:flutter/material.dart';
import 'package:company_scheduler/logic/i18n/i18n.dart';

class Time extends StatelessWidget {
  final DateTime time;

  Time({@required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            'Time',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          Internationalization.calendar('days', time.weekday) +
              ', ' +
              time.day.toString() +
              '. ' +
              Internationalization.calendar('months', time.month) +
              ' ' +
              time.year.toString() +
              ', ' +
              (time.hour < 10
                  ? '0${time.hour.toString()}'
                  : time.hour.toString()) +
              ':' +
              (time.minute < 10
                  ? '0${time.minute.toString()}'
                  : time.minute.toString()) +
              'h',
        ),
      ],
    );
  }
}
