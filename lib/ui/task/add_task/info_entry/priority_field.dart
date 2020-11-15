import 'package:flutter/material.dart';

class PriorityField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PriorityFieldState();
  }
}

class _PriorityFieldState extends State<PriorityField> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: DropdownButton(
          value: 0,
          hint: Text('Priority'),
          isExpanded: true,
          isDense: true,
          items: [],
          onChanged: (value) => null,
          underline: const SizedBox(),
        ),
      ),
    );
  }
}
