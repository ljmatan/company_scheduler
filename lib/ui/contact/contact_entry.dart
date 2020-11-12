import 'package:company_scheduler/logic/api/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactEntry extends StatelessWidget {
  final Contact contact;

  ContactEntry({@required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: InkWell(
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: kElevationToShadow[1],
          ),
          child: SizedBox(
            height: 64,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
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
                ],
              ),
            ),
          ),
        ),
        onTap: () => null,
      ),
    );
  }
}
