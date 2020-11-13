import 'package:flutter/material.dart';

class CustomSpinningIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
      child: CircularProgressIndicator(),
    );
  }
}
