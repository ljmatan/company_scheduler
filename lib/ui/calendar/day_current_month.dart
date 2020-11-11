import 'package:flutter/material.dart';

class DayCurrentMonth extends StatelessWidget {
  final int dayOfTheWeek;
  final DateTime date;
  final List events;

  DayCurrentMonth({
    @required this.dayOfTheWeek,
    @required this.date,
    @required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.1,
          color: Colors.black38,
        ),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 7,
        height: 64,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              Text(
                dayOfTheWeek.toString(),
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
