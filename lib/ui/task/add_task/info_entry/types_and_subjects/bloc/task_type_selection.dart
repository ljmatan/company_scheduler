import 'dart:async';

class TaskTypeSelection {
  static int _value;
  static int get value => _value;

  static String _type;
  static String get type => _type;

  static StreamController<String> _streamController;

  static void init() =>
      _streamController = StreamController<String>.broadcast();

  static Stream get stream => _streamController.stream;

  static void setTypeString(String value) => _type = value;

  static void change(String value) {
    _streamController.add(value);
    _value = int.parse(value);
  }

  static void dispose() {
    _streamController.close();
    _type = null;
  }
}
