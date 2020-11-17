import 'package:flutter/material.dart';

class TaskDescription extends StatelessWidget {
  final String description;

  TaskDescription({@required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            description.split('<br/>').join('\n').split('<br />').join('\n'),
          ),
        ),
      ),
    );
  }
}
