class Project {
  Project({
    this.id,
    this.name,
    this.projectType,
    this.client,
    this.projectStatus,
    this.startDate,
    this.endDate,
    this.account,
  });

  int id;
  String name;
  AccountClass projectType;
  Client client;
  ProjectStatus projectStatus;
  dynamic startDate;
  dynamic endDate;
  AccountClass account;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        name: json["name"],
        projectType: AccountClass.fromJson(json["projectType"]),
        client: Client.fromJson(json["client"]),
        projectStatus: ProjectStatus.fromJson(json["projectStatus"]),
        startDate: json["startDate"],
        endDate: json["endDate"],
        account: AccountClass.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "projectType": projectType.toJson(),
        "client": client.toJson(),
        "projectStatus": projectStatus.toJson(),
        "startDate": startDate,
        "endDate": endDate,
        "account": account.toJson(),
      };
}

class AccountClass {
  AccountClass({
    this.id,
    this.name,
    this.registerTime,
    this.active,
    this.account,
  });

  int id;
  String name;
  String registerTime;
  bool active;
  dynamic account;

  factory AccountClass.fromJson(Map<String, dynamic> json) => AccountClass(
        id: json["id"],
        name: json["name"],
        registerTime:
            json["registerTime"] == null ? null : json["registerTime"],
        active: json["active"],
        account: json["account"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "registerTime": registerTime == null ? null : registerTime,
        "active": active,
        "account": account,
      };
}

class Client {
  Client({
    this.id,
    this.name,
    this.account,
    this.clientType,
    this.address,
    this.clientTypeDto,
  });

  int id;
  String name;
  AccountClass account;
  AccountClass clientType;
  Address address;
  dynamic clientTypeDto;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        account: AccountClass.fromJson(json["account"]),
        clientType: AccountClass.fromJson(json["clientType"]),
        address: Address.fromJson(json["address"]),
        clientTypeDto: json["clientTypeDTO"],
      );

  Map<String, dynamic> toJson() => {
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

  int id;
  String street;
  String city;
  String houseno;
  String flatno;
  String phone1;
  String phone2;
  String mobile1;
  String mobile2;
  dynamic email1;
  dynamic email2;
  String note;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
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
    this.id,
    this.name,
    this.account,
  });

  int id;
  String name;
  AccountClass account;

  factory ProjectStatus.fromJson(Map<String, dynamic> json) => ProjectStatus(
        id: json["id"],
        name: json["name"],
        account: AccountClass.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "account": account.toJson(),
      };
}
