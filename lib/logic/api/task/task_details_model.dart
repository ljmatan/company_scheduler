import 'package:company_scheduler/logic/api/api.dart';

List<TaskDetails> taskDetailsFromJson(String str) => List<TaskDetails>.from(
    APIHelper.jsonCodec.decode(str).map((x) => TaskDetails.fromJson(x)));

String taskDetailsToJson(List<TaskDetails> data) =>
    APIHelper.jsonCodec.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskDetails {
  TaskDetails({
    this.entityManager,
    this.id,
    this.name,
    this.description,
    this.parent,
    this.createdTime,
    this.startTime,
    this.endTime,
    this.creator,
    this.type,
    this.subject,
    this.percent,
    this.priority,
    this.status,
    this.project,
    this.account,
    this.taskPrincipals,
    this.principalsAsString,
  });

  dynamic entityManager;
  int id;
  String name;
  String description;
  TaskDetails parent;
  int createdTime;
  int startTime;
  int endTime;
  Creator creator;
  AccountClass type;
  AccountClass subject;
  int percent;
  int priority;
  Status status;
  Project project;
  AccountClass account;
  List<AccountClass> taskPrincipals;
  String principalsAsString;

  factory TaskDetails.fromJson(Map<String, dynamic> json) => TaskDetails(
        entityManager: json["entityManager"],
        id: json["id"],
        name: json["name"],
        description: json["description"],
        parent: json["parent"] == null
            ? null
            : TaskDetails.fromJson(json["parent"]),
        createdTime: json["createdTime"],
        startTime: json["startTime"] == null ? null : json["startTime"],
        endTime: json["endTime"] == null ? null : json["endTime"],
        creator: Creator.fromJson(json["creator"]),
        type: AccountClass.fromJson(json["type"]),
        subject: json["subject"] == null
            ? null
            : AccountClass.fromJson(json["subject"]),
        percent: json["percent"],
        priority: json["priority"],
        status: Status.fromJson(json["status"]),
        project: Project.fromJson(json["project"]),
        account: AccountClass.fromJson(json["account"]),
        taskPrincipals: List<AccountClass>.from(
            json["taskPrincipals"].map((x) => AccountClass.fromJson(x))),
        principalsAsString: json["principalsAsString"],
      );

  Map<String, dynamic> toJson() => {
        "entityManager": entityManager,
        "id": id,
        "name": name,
        "description": description,
        "parent": parent == null ? null : parent.toJson(),
        "createdTime": createdTime,
        "startTime": startTime == null ? null : startTime,
        "endTime": endTime == null ? null : endTime,
        "creator": creator.toJson(),
        "type": type.toJson(),
        "subject": subject == null ? null : subject.toJson(),
        "percent": percent,
        "priority": priority,
        "status": status.toJson(),
        "project": project.toJson(),
        "account": account.toJson(),
        "taskPrincipals":
            List<dynamic>.from(taskPrincipals.map((x) => x.toJson())),
        "principalsAsString": principalsAsString,
      };
}

class Creator {
  Creator({
    this.entityManager,
    this.id,
    this.name,
    this.username,
    this.password,
    this.parent,
    this.account,
    this.createdDate,
    this.lastLogin,
    this.type,
  });

  dynamic entityManager;
  int id;
  String name;
  String username;
  String password;
  dynamic parent;
  AccountClass account;
  String createdDate;
  String lastLogin;
  Type type;

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        entityManager: json["entityManager"],
        id: json["id"],
        name: json["name"],
        username: json["username"],
        password: json["password"],
        parent: json["parent"],
        account: AccountClass.fromJson(json["account"]),
        createdDate: json["createdDate"],
        lastLogin: json["lastLogin"] == null ? null : json["lastLogin"],
        type: typeValues.map[json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "entityManager": entityManager,
        "id": id,
        "name": name,
        "username": username,
        "password": password,
        "parent": parent,
        "account": account.toJson(),
        "createdDate": createdDate,
        "lastLogin": lastLogin == null ? null : lastLogin,
        "type": typeValues.reverse[type],
      };
}

class AccountClass {
  AccountClass({
    this.entityManager,
    this.id,
    this.name,
    this.registerTime,
    this.active,
    this.account,
    this.type,
    this.principal,
  });

  dynamic entityManager;
  int id;
  String name;
  String registerTime;
  bool active;
  dynamic account;
  AccountClass type;
  Creator principal;

  factory AccountClass.fromJson(Map<String, dynamic> json) => AccountClass(
        entityManager: json["entityManager"],
        id: json["id"],
        name: json["name"],
        registerTime:
            json["registerTime"] == null ? null : json["registerTime"],
        active: json["active"] == null ? null : json["active"],
        account: json["account"],
        type: json["type"] == null ? null : AccountClass.fromJson(json["type"]),
        principal: json["principal"] == null
            ? null
            : Creator.fromJson(json["principal"]),
      );

  Map<String, dynamic> toJson() => {
        "entityManager": entityManager,
        "id": id,
        "name": name,
        "registerTime": registerTime == null ? null : registerTime,
        "active": active == null ? null : active,
        "account": account,
        "type": type == null ? null : type.toJson(),
        "principal": principal == null ? null : principal.toJson(),
      };
}

enum Password {
  THE_9365_EA12_B2_D910_E1_ACEAAC190_FBC97_A5,
  THE_098_F6_BCD4621_D373_CADE4_E832627_B4_F6
}

final passwordValues = EnumValues({
  "098f6bcd4621d373cade4e832627b4f6":
      Password.THE_098_F6_BCD4621_D373_CADE4_E832627_B4_F6,
  "9365ea12b2d910e1aceaac190fbc97a5":
      Password.THE_9365_EA12_B2_D910_E1_ACEAAC190_FBC97_A5
});

enum Type { USER, POSTGRES }

final typeValues = EnumValues({"postgres": Type.POSTGRES, "user": Type.USER});

enum Username { STEFAN, NIKOLA, DFHKSUDHFIS722417467 }

final usernameValues = EnumValues({
  "dfhksudhfis722417467": Username.DFHKSUDHFIS722417467,
  "nikola": Username.NIKOLA,
  "stefan": Username.STEFAN
});

enum AccountName {
  INPUT_DOO,
  POTENCIJALNI_KLIJENT,
  INTERNI_RAD,
  NALOG,
  PARNER,
  OTVOREN,
  NOV_OBJEKAT,
  EDUKACIJA
}

class Project {
  Project({
    this.entityManager,
    this.id,
    this.name,
    this.projectType,
    this.client,
    this.projectStatus,
    this.startDate,
    this.endDate,
    this.account,
  });

  dynamic entityManager;
  int id;
  String name;
  AccountClass projectType;
  Client client;
  ProjectStatus projectStatus;
  DateTime startDate;
  DateTime endDate;
  AccountClass account;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        entityManager: json["entityManager"],
        id: json["id"],
        name: json["name"],
        projectType: AccountClass.fromJson(json["projectType"]),
        client: Client.fromJson(json["client"]),
        projectStatus: ProjectStatus.fromJson(json["projectStatus"]),
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        account: AccountClass.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "entityManager": entityManager,
        "id": id,
        "name": name,
        "projectType": projectType.toJson(),
        "client": client.toJson(),
        "projectStatus": projectStatus.toJson(),
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "account": account.toJson(),
      };
}

class Client {
  Client({
    this.entityManager,
    this.id,
    this.name,
    this.account,
    this.clientType,
    this.address,
    this.clientTypeDto,
  });

  dynamic entityManager;
  int id;
  String name;
  AccountClass account;
  AccountClass clientType;
  Address address;
  dynamic clientTypeDto;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        entityManager: json["entityManager"],
        id: json["id"],
        name: json["name"],
        account: AccountClass.fromJson(json["account"]),
        clientType: AccountClass.fromJson(json["clientType"]),
        address: Address.fromJson(json["address"]),
        clientTypeDto: json["clientTypeDTO"],
      );

  Map<String, dynamic> toJson() => {
        "entityManager": entityManager,
        "id": id,
        "name": name,
        "account": account.toJson(),
        "clientType": clientType.toJson(),
        "address": address.toJson(),
        "clientTypeDTO": clientTypeDto,
      };
}

class Address {
  Address({
    this.entityManager,
    this.id,
    this.street,
    this.city,
    this.houseno,
    this.flatno,
    this.phone1,
    this.phone2,
    this.mobile1,
    this.mobile2,
    this.email1,
    this.email2,
    this.note,
  });

  dynamic entityManager;
  int id;
  String street;
  String city;
  String houseno;
  String flatno;
  String phone1;
  String phone2;
  String mobile1;
  String mobile2;
  String email1;
  String email2;
  String note;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        entityManager: json["entityManager"],
        id: json["id"],
        street: json["street"],
        city: json["city"],
        houseno: json["houseno"],
        flatno: json["flatno"],
        phone1: json["phone1"],
        phone2: json["phone2"],
        mobile1: json["mobile1"],
        mobile2: json["mobile2"],
        email1: json["email1"],
        email2: json["email2"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "entityManager": entityManager,
        "id": id,
        "street": street,
        "city": city,
        "houseno": houseno,
        "flatno": flatno,
        "phone1": phone1,
        "phone2": phone2,
        "mobile1": mobile1,
        "mobile2": mobile2,
        "email1": email1,
        "email2": email2,
        "note": note,
      };
}

class ProjectStatus {
  ProjectStatus({
    this.entityManager,
    this.id,
    this.name,
    this.account,
  });

  dynamic entityManager;
  int id;
  String name;
  AccountClass account;

  factory ProjectStatus.fromJson(Map<String, dynamic> json) => ProjectStatus(
        entityManager: json["entityManager"],
        id: json["id"],
        name: json["name"],
        account: AccountClass.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "entityManager": entityManager,
        "id": id,
        "name": name,
        "account": account.toJson(),
      };
}

class Status {
  Status({
    this.entityManager,
    this.id,
    this.name,
    this.taskType,
    this.opened,
    this.account,
  });

  dynamic entityManager;
  int id;
  String name;
  AccountClass taskType;
  bool opened;
  AccountClass account;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        entityManager: json["entityManager"],
        id: json["id"],
        name: json["name"],
        taskType: AccountClass.fromJson(json["taskType"]),
        opened: json["opened"],
        account: AccountClass.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "entityManager": entityManager,
        "id": id,
        "name": name,
        "taskType": taskType.toJson(),
        "opened": opened,
        "account": account.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
