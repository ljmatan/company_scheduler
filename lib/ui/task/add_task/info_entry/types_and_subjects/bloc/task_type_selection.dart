import 'dart:async';

class TaskTypeSelection {
  static String _type;
  static String get type => _type;

  static StreamController<String> _streamController;

  static void init() =>
      _streamController = StreamController<String>.broadcast();

  static Stream get stream => _streamController.stream;

  static void change(String value) {
    _streamController.add(value);
    _type = value;
  }

  static void dispose() {
    _streamController.close();
    _type = null;
  }
}
