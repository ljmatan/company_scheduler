import 'package:company_scheduler/logic/api/models/contact_model.dart';
import 'package:company_scheduler/ui/contact/contact_display/appbar.dart';
import 'package:company_scheduler/ui/contact/contact_display/button_row/button_row.dart';
import 'package:company_scheduler/ui/contact/contact_display/button_row/info_entry/info_entry.dart';
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
            ContactDisplayAppBar(
              name: contact.name,
              address: contact.address.street +
                  ' ' +
                  contact.address.houseno +
                  '/' +
                  contact.address.flatno +
                  ', ' +
                  contact.address.city,
            ),
            InfoEntry(
              icon: Icons.contact_phone,
              label: 'Phone Number',
              phone1: contact.address.phone1 ?? '',
              phone2: contact.address.phone2 ?? '',
              mobile1: contact.address.mobile1 ?? '',
              mobile2: contact.address.mobile2 ?? '',
            ),
            InfoEntry(
              icon: Icons.contact_mail,
              label: 'Email',
              email1: contact.address.email1 ?? '',
              email2: contact.address.email2 ?? '',
            ),
            InfoEntry(
              icon: Icons.chrome_reader_mode,
              label: 'Other',
              contactType: contact.contactType.name ?? '',
              clientType: contact.client.clientType.name ?? '',
              clientName: contact.client.account.name ?? '',
            ),
            const SizedBox(height: 90),
          ],
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: ButtonRow(
            houseNumber:
                contact.address.phone1 == '' ? null : contact.address.phone1,
            phoneNumber:
                contact.address.mobile1 == '' ? null : contact.address.mobile1,
            email: contact.address.email1 == '' ? null : contact.address.email1,
          ),
        ),
      ],
    );
  }
}
