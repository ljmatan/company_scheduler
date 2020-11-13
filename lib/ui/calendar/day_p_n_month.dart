import 'package:flutter/material.dart';

class DayPrevNextMonth extends StatelessWidget {
  final DateTime date;
  final List tasks;

  DayPrevNextMonth({
    @required this.date,
    @required this.tasks,
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
                  date.day.toString(),
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
