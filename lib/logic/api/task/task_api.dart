import 'package:company_scheduler/data/user_info.dart';
import 'package:company_scheduler/logic/api/api_helper.dart';
import 'package:http/http.dart' as http;

abstract class TaskAPI {
  static Future<Map> getTaskList() async {
    final response = await http.get(
      APIHelper.url +
          'taskDetails&taskId=principalTaskList&principal=${UserInfo.id}',
    );

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<Map> getTaskDetails(String taskID) async {
    final response = await http.get(
      APIHelper.url + 'taskDetails&taskId=$taskID',
    );

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<Map> getTaskComments(String taskID) async {
    final response = await http.get(
      APIHelper.url + 'taskComments&taskId=$taskID',
    );

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<Map> newTaskComment(
    int taskID,
    String comment,
    String commentDateTime,
    double hoursWorked,
  ) async {
    final body = APIHelper.jsonCodec.encode({
      "taskId": taskID,
      "comment": comment,
      "commentDate": commentDateTime,
      "hoursWorked": hoursWorked,
      "user": UserInfo.id,
    });

    final response = await http.post(APIHelper.url + 'newComment', body: body);

    final data = APIHelper.jsonCodec.decode(response.body);

    return data;
  }
}
