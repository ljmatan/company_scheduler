import 'package:flutter/material.dart';

class ContactDisplayAppBar extends StatelessWidget {
  final String name;

  ContactDisplayAppBar({@required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            name,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
