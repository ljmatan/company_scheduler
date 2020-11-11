import 'package:flutter/material.dart';

class DayPrevNextMonth extends StatelessWidget {
  final int dateDay, day, daysInMonth;

  DayPrevNextMonth({
    @required this.dateDay,
    @required this.day,
    @required this.daysInMonth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: DecoratedBox(
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
                  dateDay.toString(),
                  style: const TextStyle(
                    color: Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () => null,
    );
  }
}
