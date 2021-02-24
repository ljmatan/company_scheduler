import 'package:company_scheduler/logic/api/api.dart';
import 'package:company_scheduler/logic/api/const.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class LoginAPI {
  static Future<Map> login(String username, String password) async {
    final body = APIHelper.jsonCodec.encode({
      'username': username,
      'password': password,
    });

    var auth = 'Basic '+base64Encode(utf8.encode(basicString));

    final response = await http.post(APIHelper.url + 'login', body: body, headers: {'authorization': auth});

    final data = APIHelper.jsonCodec.decode(response.body);

    return data;
  }
}
