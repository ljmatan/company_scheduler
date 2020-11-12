import 'package:company_scheduler/logic/api/models/contact_model.dart';
import 'package:company_scheduler/ui/contact/contact_display/appbar.dart';
import 'package:company_scheduler/ui/contact/contact_display/button_row/button_row.dart';
import 'package:flutter/material.dart';

class ContactDisplay extends StatelessWidget {
  final Contact contact;

  ContactDisplay({@required this.contact});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            ContactDisplayAppBar(name: contact.name),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(),
                child: Text(
                  'Numbers',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: ButtonRow(
            number: contact.address.phone1,
            email: contact.address.email1,
          ),
        ),
      ],
    );
  }
}
