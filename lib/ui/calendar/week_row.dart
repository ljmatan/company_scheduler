import 'package:flutter/material.dart';

class WeekRow extends StatelessWidget {
  final List children;

  WeekRow({@required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(children: children);
  }
}
