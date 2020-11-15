import 'package:company_scheduler/ui/task/add_task/add_task_screen.dart';
import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 2,
      child: Icon(Icons.add, color: Colors.white),
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => AddTaskScreen()),
      ),
    );
  }
}
