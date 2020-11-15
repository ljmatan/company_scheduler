import 'package:company_scheduler/ui/task/add_task/info_entry/time_entry/time_field.dart';
import 'package:flutter/material.dart';

class TimeFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TimeField(from: true),
        TimeField(),
      ],
    );
  }
}
