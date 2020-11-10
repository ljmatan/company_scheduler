import 'package:flutter/material.dart';

class ContactEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: InkWell(
        child: SizedBox(
          height: 56,
          child: Row(
            children: [],
          ),
        ),
        onTap: () => null,
      ),
    );
  }
}
