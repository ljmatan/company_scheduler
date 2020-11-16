import 'package:company_scheduler/ui/task/add_task/data.dart';
import 'package:flutter/material.dart';

class PriorityField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PriorityFieldState();
  }
}

class _PriorityFieldState extends State<PriorityField> {
  int _value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: DropdownButton(
            value: _value,
            hint: Text('Priority'),
            isExpanded: true,
            isDense: true,
            items: [
              DropdownMenuItem(
                value: 0,
                child: Text('Low priority'),
              ),
              DropdownMenuItem(
                value: 3,
                child: Text('Medium priority'),
              ),
              DropdownMenuItem(
                value: 6,
                child: Text('High priority'),
              ),
              DropdownMenuItem(
                value: 10,
                child: Text('Critical priority'),
              ),
            ],
            onChanged: (value) {
              NewTaskData.setPriority(value);
              setState(() => _value = value);
            },
            underline: const SizedBox(),
          ),
        ),
      ),
    );
  }
}
