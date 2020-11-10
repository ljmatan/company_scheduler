import 'dart:convert';

abstract class APIHelper {
  static const String url = 'https://185.119.88.94:8080/crm-jsf/';

  static const JsonCodec jsonCodec = const JsonCodec();
}
