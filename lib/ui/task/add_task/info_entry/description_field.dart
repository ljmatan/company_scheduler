import 'package:company_scheduler/ui/task/add_task/data.dart';
import 'package:flutter/material.dart';

class DescriptionField extends StatelessWidget {
  final TextEditingController controller;

  DescriptionField({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: 2,
      maxLines: 2,
      decoration: InputDecoration(
        labelText: 'Description',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 0.1),
        ),
      ),
      onChanged: (text) => NewTaskData.setDescription(text),
    );
  }
}
