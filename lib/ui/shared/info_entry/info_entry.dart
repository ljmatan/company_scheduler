import 'package:company_scheduler/ui/shared/info_row.dart';
import 'package:flutter/material.dart';

class InfoEntry extends StatelessWidget {
  final IconData icon;
  final String label, phone1, phone2, mobile1, mobile2;
  final String email1, email2;
  final String contactType, clientName;

  InfoEntry({
    @required this.icon,
    @required this.label,
    this.phone1,
    this.phone2,
    this.mobile1,
    this.mobile2,
    this.email1,
    this.email2,
    this.contactType,
    this.clientName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.black54,
                  size: 13,
                ),
                Text(
                  '  $label',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          if (phone1 != null)
            InfoRow(
              label: 'House 1',
              details: phone1,
              copiable: true,
            ),
          if (phone2 != null)
            InfoRow(
              label: 'House 2',
              details: phone2,
              copiable: true,
            ),
          if (mobile1 != null)
            InfoRow(
              label: 'Mobile 1',
              details: mobile1,
              copiable: true,
            ),
          if (mobile2 != null)
            InfoRow(
              label: 'Mobile 2',
              details: mobile2,
              copiable: true,
            ),
          if (email1 != null)
            InfoRow(
              label: 'Email 1',
              details: email1,
              copiable: true,
            ),
          if (email2 != null)
            InfoRow(
              label: 'Email 2',
              details: email2,
              copiable: true,
            ),
          if (contactType != null)
            InfoRow(
              label: 'Contact type',
              details: contactType,
            ),
          if (clientName != null)
            InfoRow(
              label: 'Client name',
              details: clientName,
            ),
        ],
      ),
    );
  }
}
