import 'package:company_scheduler/ui/calendar/bloc/day_selection.dart';
import 'package:flutter/material.dart';

class DayCurrentMonth extends StatelessWidget {
  final int day;
  final DateTime date;
  final List events;

  DayCurrentMonth({
    @required this.day,
    @required this.date,
    @required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DaySelection.stream,
      initialData: DaySelection.selected,
      builder: (context, selected) => InkWell(
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.1,
              color: Colors.black38,
            ),
            color: selected.data.day == day ? Colors.grey.shade200 : null,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 7,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  Text(
                    day.toString(),
                    style: TextStyle(
                      color: day == DateTime.now().day &&
                              date.month == DateTime.now().month &&
                              date.year == DateTime.now().year
                          ? Theme.of(context).primaryColor
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: selected.data.day == day
            ? null
            : () => DaySelection.change(
                  DateTime(
                    date.year,
                    date.month,
                    day,
                  ),
                ),
      ),
    );
  }
}
