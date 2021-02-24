import 'package:company_scheduler/logic/api/api.dart';
import 'package:company_scheduler/logic/local_storage/data/user_info.dart';
import 'package:http/http.dart' as http;
import 'package:company_scheduler/logic/api/const.dart';
import 'dart:convert';

abstract class TaskAPI {
  static Future<List> getTaskList() async {
    var auth = 'Basic '+base64Encode(utf8.encode(basicString));

    final response = await http.get(
        APIHelper.url + 'principalTaskList&principal=${UserInfo.id}',headers: {'authorization': auth,
      'username' : '${UserInfo.username}', 'password' : '${UserInfo.password}'}
    );

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<List> getTaskTypes() async {
    var auth = 'Basic '+base64Encode(utf8.encode(basicString));

    final response = await http.get(APIHelper.url + 'taskTypes', headers: {'authorization': auth,
      'username' : '${UserInfo.username}', 'password' : '${UserInfo.password}'});

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<List> getTaskSubjectForTaskType(String taskTypeID) async {
    var auth = 'Basic '+base64Encode(utf8.encode(basicString));

    final response = await http.get(
        APIHelper.url + 'taskSubjectForTaskType&taskType=$taskTypeID',headers: {'authorization': auth,
      'username' : '${UserInfo.username}', 'password' : '${UserInfo.password}'}
    );

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<List> getPrincipalList() async {
    var auth = 'Basic '+base64Encode(utf8.encode(basicString));

    final response = await http.get(APIHelper.url + 'principalList',headers: {'authorization': auth,
      'username' : '${UserInfo.username}', 'password' : '${UserInfo.password}'});

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<List> getPrincipalListForTask(String taskID) async {
    var auth = 'Basic '+base64Encode(utf8.encode(basicString));

    final response = await http.get(
        APIHelper.url + 'principalList&taskId=$taskID', headers: {'authorization': auth,
      'username' : '${UserInfo.username}', 'password' : '${UserInfo.password}'}
    );

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<List> getTaskLogs(String taskID) async {
    var auth = 'Basic '+base64Encode(utf8.encode(basicString));

    final response = await http.get(
        APIHelper.url + 'taskLogs&taskId=$taskID', headers: {'authorization': auth,
      'username' : '${UserInfo.username}', 'password' : '${UserInfo.password}'}
    );

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<List> projectSearch(String term) async {
    var auth = 'Basic '+base64Encode(utf8.encode(basicString));

    final response = await http.get(
        APIHelper.url + 'projectSearch&searchString=$term',headers: {'authorization': auth,
      'username' : '${UserInfo.username}', 'password' : '${UserInfo.password}'}
    );

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<Map> newTask(
      String name,
      String description,
      int priority,
      int type,
      int subject,
      int project,
      int startTime,
      int endTime,
      List principals,
      ) async {
    final body = APIHelper.jsonCodec.encode({
      'name': name,
      'description': description,
      'priority': priority,
      'type': type,
      'subject': subject,
      'project': project,
      'startTime': startTime,
      'endTime': endTime,
      'principalList': principals,
    });
    var auth = 'Basic '+base64Encode(utf8.encode(basicString));
    final response = await http.post(APIHelper.url + 'newTask', body: body, headers: {'authorization': auth,
      'username' : '${UserInfo.username}', 'password' : '${UserInfo.password}'});

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<Map> getTaskDetails(String taskID) async {
    var auth = 'Basic '+base64Encode(utf8.encode(basicString));

    final response = await http.get(
        APIHelper.url + 'taskDetails&taskId=$taskID', headers: {'authorization': auth,
      'username' : '${UserInfo.username}', 'password' : '${UserInfo.password}'}
    );

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<List> getTaskComments(String taskID) async {
    var auth = 'Basic '+base64Encode(utf8.encode(basicString));

    final response = await http.get(
        APIHelper.url + 'taskComments&taskId=$taskID', headers: {'authorization': auth,
      'username' : '${UserInfo.username}', 'password' : '${UserInfo.password}'}
    );

    return APIHelper.jsonCodec.decode(response.body);
  }

  static Future<Map> newTaskComment(
      int taskID,
      String comment,
      int commentDateTime,
      double hoursWorked,
      ) async {
    final body = APIHelper.jsonCodec.encode({
      "taskId": taskID,
      "comment": comment,
      "commentDate": commentDateTime,
      "hoursWorked": hoursWorked,
      "user": UserInfo.id,
    });
    var auth = 'Basic '+base64Encode(utf8.encode(basicString));
    final response = await http.post(APIHelper.url + 'newComment', body: body, headers: {'authorization': auth,
      'username' : '${UserInfo.username}', 'password' : '${UserInfo.password}'});

    final data = APIHelper.jsonCodec.decode(response.body);

    return data;
  }
}
