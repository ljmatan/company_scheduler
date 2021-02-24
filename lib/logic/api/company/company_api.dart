import 'package:company_scheduler/logic/api/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:company_scheduler/logic/api/const.dart';
import 'package:company_scheduler/logic/local_storage/data/user_info.dart';


abstract class CompanyAPI {


  static Future<List> getCompanies(String searchTerm) async {
    var auth = 'Basic '+base64Encode(utf8.encode(basicString));

    final response = await http.get(
      APIHelper.url + 'companySearch&searchString=$searchTerm', headers: {'authorization': auth,
      'username' : '${UserInfo.username}', 'password' : '${UserInfo.password}'}
    );

    return APIHelper.jsonCodec.decode(response.body);
  }
}
