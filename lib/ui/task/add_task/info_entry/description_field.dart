import 'package:flutter/material.dart';

class DescriptionField extends StatelessWidget {
  final TextEditingController controller;

  DescriptionField({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 2,
      minLines: 2,
      decoration: InputDecoration(
        labelText: 'Description',
      ),
    );
  }
}
