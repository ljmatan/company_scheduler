import 'package:flutter/material.dart';

class TaskEntry extends StatelessWidget {
  final String subject;
  final int percent;
  final DateTime startTime, endTime;

  TaskEntry({
    @required this.subject,
    @required this.percent,
    @required this.startTime,
    @required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: InkWell(
        child: Ink(
          decoration: BoxDecoration(
            boxShadow: kElevationToShadow[1],
            color: Colors.white,
          ),
          child: SizedBox(
            height: 56,
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.black54),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: percent == 100
                          ? null
                          : Border(
                              left: BorderSide(
                                width: 6,
                                color: Colors.green,
                              ),
                            ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        percent == 100 ? 6 : 12,
                        6,
                        0,
                        6,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            subject,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('SOC190'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 6, 6, 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(percent.toString() + '%'),
                        Text(
                          (startTime.day < 10
                                  ? '0' + startTime.day.toString()
                                  : startTime.day.toString()) +
                              '/' +
                              (startTime.month < 10
                                  ? '0' + startTime.month.toString()
                                  : startTime.month.toString()) +
                              ' - ' +
                              (endTime.day < 10
                                  ? '0' + endTime.day.toString()
                                  : endTime.day.toString()) +
                              '/' +
                              (endTime.month < 10
                                  ? '0' + endTime.month.toString()
                                  : endTime.month.toString()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () => null,
      ),
    );
  }
}
