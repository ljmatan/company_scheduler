import 'dart:convert';

abstract class APIHelper {
  static const String url = 'http://185.119.88.94:8080/crm-jsf/';

  static const JsonCodec jsonCodec = const JsonCodec();
}
