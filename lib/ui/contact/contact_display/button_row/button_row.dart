import 'package:company_scheduler/ui/contact/contact_display/button_row/action_button.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final String houseNumber, phoneNumber, email;

  ButtonRow({
    @required this.houseNumber,
    @required this.phoneNumber,
    @required this.email,
  });

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
            url: houseNumber != null ? 'tel:$houseNumber' : null,
          ),
          ActionButton(
            icon: Icons.message,
            label: 'Text',
            url: phoneNumber != null ? 'sms:$phoneNumber' : null,
          ),
          ActionButton(
            icon: Icons.email,
            label: 'Email',
            url: email != null ? 'mailto:$email' : null,
          ),
        ],
      ),
    );
  }
}
