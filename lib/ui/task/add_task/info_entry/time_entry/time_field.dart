import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeField extends StatefulWidget {
  final String label;

  TimeField({@required this.label});

  @override
  State<StatefulWidget> createState() {
    return _TimeFieldState();
  }
}

class _TimeFieldState extends State<TimeField> {
  DateTime _time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: const EdgeInsets.only(),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  widget.label,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              Text(
                _time.day.toString() +
                    '/' +
                    _time.month.toString() +
                    '/' +
                    _time.year.toString() +
                    '\n' +
                    (_time.hour < 10
                        ? '0${_time.hour.toString()}'
                        : _time.hour.toString()) +
                    ' : ' +
                    (_time.minute < 10
                        ? '0${_time.minute.toString()}'
                        : _time.minute.toString()),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) => CupertinoApp(
          debugShowCheckedModeBanner: false,
          theme: CupertinoThemeData(brightness: Brightness.light),
          home: CupertinoDatePicker(
            use24hFormat: true,
            initialDateTime: DateTime.now().add(Duration(hours: 1)),
            minimumDate: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day),
            maximumDate: DateTime(10000),
            onDateTimeChanged: (date) {
              setState(() => _time = date);
            },
          ),
        ),
      ),
    );
  }
}
