import 'dart:async';

abstract class Copied {
  static StreamController<String> _streamController;

  static void init() =>
      _streamController = StreamController<String>.broadcast();

  static Stream get stream => _streamController.stream;

  static void update(String value) => _streamController.add(value);

  static void dispose() => _streamController.close();
}
