import 'package:company_scheduler/logic/api/models/contact_model.dart';
import 'package:company_scheduler/ui/contact/contact_display.dart';
import 'package:flutter/material.dart';

class ContactEntry extends StatelessWidget {
  final Contact contact;

  ContactEntry({@required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        child: Ink(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.1,
                color: Colors.black54,
              ),
            ),
          ),
          child: SizedBox(
            height: 56,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        contact.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        contact.contactType.name + ', ' + contact.address.city,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        contact.client.name,
                        style: const TextStyle(color: Colors.black54),
                      ),
                      Text(
                        contact.client.clientType.name,
                        style: const TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => ContactDisplay(contact: contact),
        ),
      ),
    );
  }
}
