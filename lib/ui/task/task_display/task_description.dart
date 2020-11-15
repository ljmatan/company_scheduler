import 'package:flutter/material.dart';

class TaskDescription extends StatelessWidget {
  final String description;

  TaskDescription({@required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          description.split('<br/>').join('\n'),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
