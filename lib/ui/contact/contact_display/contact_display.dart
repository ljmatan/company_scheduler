import 'package:company_scheduler/logic/api/contact/contact_model.dart';
import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/shared/appbar.dart';
import 'package:company_scheduler/ui/shared/bloc/copied.dart';
import 'package:company_scheduler/ui/shared/button_row/button_row.dart';
import 'package:company_scheduler/ui/shared/info_entry/info_entry.dart';
import 'package:flutter/material.dart';

class ContactDisplay extends StatefulWidget {
  final Contact contact;

  ContactDisplay({@required this.contact});

  @override
  State<StatefulWidget> createState() {
    return _ContactDisplayState();
  }
}

class _ContactDisplayState extends State<ContactDisplay> {
  @override
  void initState() {
    super.initState();
    Copied.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              ContactCompanyDisplayAppBar(
                name: widget.contact.name,
                address: widget.contact.address,
              ),
              InfoEntry(
                icon: Icons.contact_phone,
                label: Internationalization.results('phone number'),
                phone1: widget.contact.address.phone1 ?? '',
                phone2: widget.contact.address.phone2 ?? '',
                mobile1: widget.contact.address.mobile1 ?? '',
                mobile2: widget.contact.address.mobile2 ?? '',
              ),
              InfoEntry(
                icon: Icons.contact_mail,
                label: 'Email',
                email1: widget.contact.address.email1 ?? '',
                email2: widget.contact.address.email2 ?? '',
              ),
              InfoEntry(
                icon: Icons.chrome_reader_mode,
                label: Internationalization.results('other'),
                contactType: widget.contact.contactType.name ?? '',
                clientName: widget.contact.client.name ?? '',
              ),
              const SizedBox(height: 90),
            ],
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ButtonRow(
              houseNumber: widget.contact.address.phone1 == ''
                  ? null
                  : widget.contact.address.phone1,
              phoneNumber: widget.contact.address.mobile1 == ''
                  ? null
                  : widget.contact.address.mobile1,
              email: widget.contact.address.email1 == null
                  ? null
                  : widget.contact.address.email1,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Copied.dispose();
    super.dispose();
  }
}
