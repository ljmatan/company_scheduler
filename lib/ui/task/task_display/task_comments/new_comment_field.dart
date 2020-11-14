import 'package:flutter/material.dart';

class NewCommentField extends StatelessWidget {
  final TextEditingController controller;

  NewCommentField({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'New comment',
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(Icons.check),
            onPressed: () => print('aaaa'),
          ),
        ),
      ),
    );
  }
}
