import 'package:company_scheduler/logic/api_helper/api_helper.dart';
import 'package:http/http.dart' as http;

abstract class LoginAPI {
  static Future<Map> login(String username, String password) async {
    final body = APIHelper.jsonCodec.encode({
      'username': username,
      'password': password,
    });

    final response = await http.post(APIHelper.url + 'login', body: body);

    final data = APIHelper.jsonCodec.decode(response.body);

    return data;
  }
}
