import 'package:http/http.dart' as http;
import 'package:company_scheduler/logic/api/api.dart';
import 'package:company_scheduler/logic/api/const.dart';
import 'package:company_scheduler/logic/local_storage/data/user_info.dart';
import 'dart:convert';


abstract class ContactAPI {

  static Future<List> getContacts(String searchTerm) async {

    var auth = 'Basic '+base64Encode(utf8.encode(basicString));
    final response = await http.get(
      APIHelper.url + 'contactSearch&searchString=$searchTerm', headers: {'authorization': auth,
          'username' : '${UserInfo.username}', 'password' : '${UserInfo.password}'}
    );

    return APIHelper.jsonCodec.decode(response.body);
  }
}
