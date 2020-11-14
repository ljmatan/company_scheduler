import 'package:company_scheduler/logic/api/api.dart';
import 'package:company_scheduler/logic/local_storage/data/user_info.dart';
import 'package:http/http.dart' as http;

abstract class TaskAPI {
  static Future<List> getTaskList() async {
    final response = await http.get(
      APIHelper.url + 'principalTaskList&principal=${UserInfo.id}',
    );

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<List> getTaskTypes(String taskID) async {
    final response = await http.get(
      APIHelper.url + 'taskTypes&taskId=$taskID',
    );

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<List> getTaskSubjectForTaskType(
    String taskID,
    String taskTypeID,
  ) async {
    final response = await http.get(
      APIHelper.url +
          'taskSubjectForTaskType&taskId=$taskID&taskType=$taskTypeID',
    );

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<List> getPrincipalList(String taskID) async {
    final response = await http.get(
      APIHelper.url + 'principalList&taskId=$taskID',
    );

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<Map> getTaskDetails(String taskID) async {
    final response = await http.get(
      APIHelper.url + 'taskDetails&taskId=$taskID',
    );

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<List> getTaskComments(String taskID) async {
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
