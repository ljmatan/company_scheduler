import 'package:company_scheduler/logic/i18n/string_values.dart';

abstract class Internationalization {
  static String _languageCode = 'en';

  static String login(String value) =>
      StringValues.values[_languageCode]['login'][value];

  static String dash(String value) =>
      StringValues.values[_languageCode]['dashboard'][value];
}
