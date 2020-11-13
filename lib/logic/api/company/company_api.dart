import 'package:company_scheduler/logic/api/api.dart';
import 'package:http/http.dart' as http;

abstract class CompanyAPI {
  static Future<List> getCompanies(String searchTerm) async {
    final response = await http.get(
      APIHelper.url + 'companySearch&searchString=$searchTerm',
    );

    return APIHelper.jsonCodec.decode(response.body);
  }
}
