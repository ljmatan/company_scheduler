import 'dart:async';

abstract class TaskAndTypesInput {
  static Map _list;
  static Map get list => _list;
  static void setMap(Map value) => _list = value;

  static StreamController<Map> _streamController;

  static void init() => _streamController = StreamController<Map>.broadcast();

  static Stream get stream => _streamController.stream;

  static void update() => _streamController.add(_list);

  static void dispose() {
    _streamController.close();
    _list = null;
  }
}
