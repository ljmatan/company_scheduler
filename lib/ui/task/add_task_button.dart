import 'package:company_scheduler/ui/task/add_task/add_task_screen.dart';
import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  final Function updateList;

  AddTaskButton({@required this.updateList});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 1,
      disabledElevation: 1,
      focusElevation: 1,
      highlightElevation: 1,
      hoverElevation: 1,
      child: Icon(Icons.add, color: Colors.white),
      onPressed: () => Navigator.of(context)
          .push(
            MaterialPageRoute(
              builder: (BuildContext context) => AddTaskScreen(),
            ),
          )
          .then(
            (value) => value ? updateList() : null,
          ),
    );
  }
}
