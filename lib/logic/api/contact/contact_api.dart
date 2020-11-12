import 'package:company_scheduler/logic/api/api_helper.dart';
import 'package:http/http.dart' as http;

abstract class ContactAPI {
  static Future<Map> getContacts(String searchTerm) async {
    final response = await http.get(
      APIHelper.url + 'contactSearch&amp;searchString=$searchTerm',
    );

    return APIHelper.jsonCodec.decode(response.body);
  }
}
