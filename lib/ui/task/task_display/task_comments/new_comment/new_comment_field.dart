import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:flutter/material.dart';

class NewCommentField extends StatelessWidget {
  final TextEditingController controller;
  final PageController pageController;

  NewCommentField({
    @required this.controller,
    @required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: Internationalization.task('new comment'),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 0.1),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.1),
              ),
            ),
          ),
        ),
        Positioned(
          right: 8,
          top: 0,
          bottom: 0,
          child: IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              if (controller.text.length < 5)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Please enter a valid comment'),
                ));
              else {
                FocusScope.of(context).unfocus();
                pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
