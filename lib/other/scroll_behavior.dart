import 'package:flutter/material.dart';

/// Removes overscroll effect
class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
          BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;
}
