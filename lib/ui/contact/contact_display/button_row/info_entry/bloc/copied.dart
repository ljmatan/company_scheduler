import 'dart:async';

abstract class Copied {
  static StreamController<bool> _streamController;

  static void init() => _streamController = StreamController<bool>.broadcast();

  static Stream get stream => _streamController.stream;

  static void update() => _streamController.add(false);

  static void dispose() => _streamController.close();
}
