import 'package:company_scheduler/logic/api/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactDisplay extends StatelessWidget {
  final Contact contact;

  ContactDisplay({@required this.contact});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [],
      ),
    );
  }
}
