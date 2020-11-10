import 'dart:async';

abstract class TextFieldEnabled {
  static final StreamController<bool> _streamController =
      StreamController<bool>.broadcast();

  static Stream get stream => _streamController.stream;

  static void change(bool) => _streamController.add(bool);

  static void dispose() => _streamController.close();
}
