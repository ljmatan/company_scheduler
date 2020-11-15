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
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16),
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
            setState(() => _value = value);
          },
          underline: const SizedBox(),
        ),
      ),
    );
  }
}
