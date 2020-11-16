import 'package:company_scheduler/ui/task/add_task/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeField extends StatefulWidget {
  final bool from;

  TimeField({this.from: false});

  @override
  State<StatefulWidget> createState() {
    return _TimeFieldState();
  }
}

class _TimeFieldState extends State<TimeField> {
  DateTime _time = DateTime.now();

  @override
  void initState() {
    super.initState();
    widget.from
        ? NewTaskData.setStartTime(_time.millisecondsSinceEpoch)
        : NewTaskData.setEndTime(_time.millisecondsSinceEpoch);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  widget.from ? 'from' : 'to',
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus.unfocus();
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000, 12),
          lastDate: DateTime(2040, 10),
        ).then(
          (date) {
            _time = date;
            showTimePicker(
              context: context,
              initialTime: TimeOfDay(
                hour: _time.hour,
                minute: _time.minute,
              ),
            ).then(
              (time) {
                setState(
                  () => _time = DateTime(
                    _time.year,
                    _time.month,
                    _time.day,
                    time.hour,
                    time.minute,
                  ),
                );
                widget.from
                    ? NewTaskData.setStartTime(_time.millisecondsSinceEpoch)
                    : NewTaskData.setEndTime(_time.millisecondsSinceEpoch);
              },
            );
          },
        );
        /*showModalBottomSheet(
          context: context,
          builder: (context) => CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: CupertinoThemeData(brightness: Brightness.light),
            home: CupertinoDatePicker(
              use24hFormat: true,
              initialDateTime: DateTime.now().add(Duration(hours: 1)),
              minimumDate: DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day),
              maximumDate: DateTime(10000),
              onDateTimeChanged: (date) {
                widget.from
                    ? NewTaskData.setStartTime(date.millisecondsSinceEpoch)
                    : NewTaskData.setEndTime(date.millisecondsSinceEpoch);
                setState(() => _time = date);
              },
            ),
          ),
        );*/
      },
    );
  }
}
