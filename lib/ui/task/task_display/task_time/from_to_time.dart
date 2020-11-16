import 'package:flutter/material.dart';

class FromToTime extends StatelessWidget {
  final DateTime time;
  final String label;

  FromToTime({@required this.time, @required this.label});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                label,
                style: const TextStyle(color: Colors.black54),
              ),
            ),
            Text(
              time.day.toString() +
                  '/' +
                  time.month.toString() +
                  '/' +
                  time.year.toString() +
                  '\n' +
                  (time.hour < 10
                      ? '0${time.hour.toString()}'
                      : time.hour.toString()) +
                  ' : ' +
                  (time.minute < 10
                      ? '0${time.minute.toString()}'
                      : time.minute.toString()),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
