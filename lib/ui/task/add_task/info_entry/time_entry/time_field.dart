import 'package:company_scheduler/logic/i18n/i18n.dart';
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
                  Internationalization.task(
                    widget.from ? 'from' : 'to',
                  ),
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
          locale: Locale(Internationalization.languageCode),
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
      },
    );
  }
}
