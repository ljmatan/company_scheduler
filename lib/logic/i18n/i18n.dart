import 'package:company_scheduler/logic/i18n/string_values.dart';

abstract class Internationalization {
  // To change app language to Serbian, set below string to 'rs'
  static const String _languageCode = 'en';

  static String login(String value) =>
      StringValues.values[_languageCode]['login'][value];

  static String dash(String value) =>
      StringValues.values[_languageCode]['dashboard'][value];

  static String calendar(String selection, value) =>
      StringValues.values[_languageCode]['calendar'][selection][value];
}
