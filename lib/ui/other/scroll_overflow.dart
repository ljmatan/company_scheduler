import 'package:flutter/material.dart';

class ScrollOverflowEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey[50],
            Colors.grey[50].withOpacity(0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SizedBox(
        height: 16,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
