import 'package:company_scheduler/ui/task/add_task/add_task_sheet.dart';
import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 2,
      child: Icon(Icons.add),
      onPressed: () => showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => AddTaskSheet(),
      ),
    );
  }
}
