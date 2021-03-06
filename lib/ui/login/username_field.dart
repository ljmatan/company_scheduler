import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/login/bloc/textfield_enabled.dart';
import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController controller;

  UsernameField({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 10),
      child: StreamBuilder(
        stream: TextFieldEnabled.stream,
        initialData: true,
        builder: (context, enabled) => TextField(
          controller: controller,
          enabled: enabled.data,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(14, 18, 14, 18),
            border: OutlineInputBorder(),
            labelText: Internationalization.login('username'),
          ),
        ),
      ),
    );
  }
}
