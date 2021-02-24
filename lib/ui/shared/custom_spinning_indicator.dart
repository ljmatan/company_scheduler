import 'package:flutter/material.dart';

class CustomSpinningIndicator extends StatelessWidget {
  final double size;

  CustomSpinningIndicator({this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 64,
      width: size ?? 64,
      child: CircularProgressIndicator(),
    );
  }
}
