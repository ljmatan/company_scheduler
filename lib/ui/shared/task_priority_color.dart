import 'package:flutter/material.dart' show Color, Colors;

abstract class TaskPriorityColor {
  static Color color(int priority) => priority == 0
      ? Colors.green.shade300
      : priority == 3
          ? Colors.amber.shade300
          : priority == 6
              ? Colors.red.shade300
              : priority == 10
                  ? Colors.black
                  : Colors.grey.shade300;
}
