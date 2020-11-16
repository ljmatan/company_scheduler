import 'dart:async';

abstract class DaySelection {
  static DateTime _selected = DateTime.now();
  static DateTime selected() => _selected;

  static StreamController<DateTime> _streamController;

  static void init() =>
      _streamController = StreamController<DateTime>.broadcast();

  static Stream get stream => _streamController.stream;

  static void change(DateTime date) {
    _selected = date;
    _streamController.add(date);
  }

  static void dispose() {
    _streamController.close();
    _selected = DateTime.now();
  }
}
