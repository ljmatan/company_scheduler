import 'dart:async';

abstract class DateSelection {
  static StreamController<DateTime> _streamController;

  static void init() =>
      _streamController = StreamController<DateTime>.broadcast();

  static Stream get stream => _streamController.stream;

  static void change(DateTime date) => _streamController.add(date);

  static void dispose() => _streamController.close();
}
