import 'package:company_scheduler/logic/i18n/string_values.dart';

abstract class Internationalization {
  // To change app language to English, set below string to 'en'
  static const String languageCode = 'sr';

  static String login(String value) =>
      StringValues.values[languageCode]['login'][value];

  static String dash(String value) =>
      StringValues.values[languageCode]['dashboard'][value];

  static String calendar(String selection, value) =>
      StringValues.values[languageCode]['calendar'][selection][value];

  static String search(String value) =>
      StringValues.values[languageCode]['search'][value];

  static String results(String value) =>
      StringValues.values[languageCode]['results'][value];

  static String task(String value) =>
      StringValues.values[languageCode]['task'][value];

  static String misc(String value) =>
      StringValues.values[languageCode]['misc'][value];
}
