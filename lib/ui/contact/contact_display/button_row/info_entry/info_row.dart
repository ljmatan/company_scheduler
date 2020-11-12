import 'package:company_scheduler/ui/contact/contact_display/button_row/info_entry/copy_button.dart';
import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label, details;
  final bool selectable;

  InfoRow({
    @required this.label,
    @required this.details,
    this.selectable,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: selectable != null && selectable && details != '' ? 0 : 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w400,
            ),
          ),
          details != ''
              ? selectable != null && selectable
                  ? CopyButton(details: details)
                  : Text(details)
              : Text(
                  'no info',
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
        ],
      ),
    );
  }
}
