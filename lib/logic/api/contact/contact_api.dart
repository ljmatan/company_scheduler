import 'package:http/http.dart' as http;
import 'package:company_scheduler/logic/api/api.dart';

abstract class ContactAPI {
  static Future<List> getContacts(String searchTerm) async {
    final response = await http.get(
      APIHelper.url + 'contactSearch&searchString=$searchTerm',
    );

    return APIHelper.jsonCodec.decode(response.body);
  }
}
