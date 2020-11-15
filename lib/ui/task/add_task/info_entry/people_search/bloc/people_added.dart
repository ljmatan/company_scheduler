import 'dart:async';
import 'package:company_scheduler/logic/api/task/principal_model.dart';

abstract class PeopleAdded {
  static List<Principal> _list;
  static List<Principal> get list => _list;

  static StreamController<List<Principal>> _streamController;

  static void init() {
    _list = [];
    _streamController = StreamController<List<Principal>>.broadcast();
  }

  static Stream get stream => _streamController.stream;

  static void add(Principal principal) {
    _list.add(principal);
    _streamController.add(_list);
  }

  static void remove(Principal principal) {
    _list.removeWhere((element) => element == principal);
    _streamController.add(_list);
  }

  static void dispose() {
    _streamController.close();
    _list = null;
  }
}
