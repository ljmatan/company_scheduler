import 'dart:async';

abstract class TabControl {
  static StreamController<int> _streamController;

  static void init() => _streamController = StreamController<int>.broadcast();

  static Stream get stream => _streamController.stream;

  static void change(int page) => _streamController.add(page);

  static void dispose() => _streamController.close();
}
