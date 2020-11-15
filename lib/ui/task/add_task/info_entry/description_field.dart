import 'package:company_scheduler/ui/task/add_task/data.dart';
import 'package:flutter/material.dart';

class DescriptionField extends StatelessWidget {
  final TextEditingController controller;

  DescriptionField({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Description',
      ),
      onChanged: (text) => NewTaskData.setDescription(text),
    );
  }
}
