import 'package:company_scheduler/ui/task/add_task/data.dart';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final TextEditingController controller;

  NameField({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Task name',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 0.1),
        ),
      ),
      onChanged: (text) => NewTaskData.setTaskName(text),
    );
  }
}
