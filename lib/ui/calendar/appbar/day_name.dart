import 'package:flutter/material.dart';

class DayName extends StatelessWidget {
  final String day;

  DayName({@required this.day});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 7,
        child: Center(
          child: Text(
            day.substring(0, 3),
            style: const TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
