import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/shared/copy_button.dart';
import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label, details;
  final bool copiable;

  InfoRow({
    @required this.label,
    @required this.details,
    this.copiable,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: copiable != null && copiable && details != '' ? 0 : 10,
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
              ? copiable != null && copiable
                  ? CopyButton(details: details)
                  : Text(details)
              : Text(
                  Internationalization.results('no info'),
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
        ],
      ),
    );
  }
}
