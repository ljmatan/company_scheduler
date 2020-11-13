import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/login/bloc/textfield_enabled.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;

  PasswordField({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: StreamBuilder(
        stream: TextFieldEnabled.stream,
        initialData: true,
        builder: (context, enabled) => TextField(
          controller: controller,
          enabled: enabled.data,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(),
            labelText: Internationalization.login('password'),
          ),
        ),
      ),
    );
  }
}
