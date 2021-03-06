import 'package:company_scheduler/logic/i18n/i18n.dart';
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
        labelText: Internationalization.task('task name'),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 0.1),
        ),
      ),
      onChanged: (text) => NewTaskData.setTaskName(text),
    );
  }
}
