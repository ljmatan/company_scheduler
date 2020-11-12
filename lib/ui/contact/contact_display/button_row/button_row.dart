import 'package:company_scheduler/ui/contact/contact_display/button_row/action_button.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final String number, email;

  ButtonRow({@required this.number, @required this.email});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kElevationToShadow[1],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ActionButton(
            icon: Icons.call,
            label: 'Call',
            url: 'tel:$number',
          ),
          ActionButton(
            icon: Icons.message,
            label: 'Text',
            url: 'sms:$number',
          ),
          ActionButton(
            icon: Icons.email,
            label: 'Email',
            url: 'mailto:$email',
          ),
        ],
      ),
    );
  }
}
