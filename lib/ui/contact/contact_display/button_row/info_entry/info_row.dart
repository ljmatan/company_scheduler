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
                  ? FlatButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        details,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => null,
                    )
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
