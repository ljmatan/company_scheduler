import 'package:company_scheduler/logic/api/api_helper.dart';

Contact contactFromJson(String str) =>
    Contact.fromJson(APIHelper.jsonCodec.decode(str));

String contactToJson(Contact data) => APIHelper.jsonCodec.encode(data.toJson());

class Contact {
  Contact({
    this.entityManager,
    this.id,
    this.name,
    this.address,
    this.account,
    this.client,
    this.contactType,
    this.attributes,
  });

  dynamic entityManager;
  int id;
  String name;
  Address address;
  AccountClass account;
  Client client;
  AccountClass contactType;
  dynamic attributes;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        entityManager: json["entityManager"],
        id: json["id"],
        name: json["name"],
        address: Address.fromJson(json["address"]),
        account: AccountClass.fromJson(json["account"]),
        client: Client.fromJson(json["client"]),
        contactType: AccountClass.fromJson(json["contactType"]),
        attributes: json["attributes"],
      );

  Map<String, dynamic> toJson() => {
        "entityManager": entityManager,
        "id": id,
        "name": name,
        "address": address.toJson(),
        "account": account.toJson(),
        "client": client.toJson(),
        "contactType": contactType.toJson(),
        "attributes": attributes,
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
  });

  dynamic entityManager;
  int id;
  String name;
  String registerTime;
  bool active;
  dynamic account;

  factory AccountClass.fromJson(Map<String, dynamic> json) => AccountClass(
        entityManager: json["entityManager"],
        id: json["id"],
        name: json["name"],
        registerTime:
            json["registerTime"] == null ? null : json["registerTime"],
        active: json["active"],
        account: json["account"],
      );

  Map<String, dynamic> toJson() => {
        "entityManager": entityManager,
        "id": id,
        "name": name,
        "registerTime": registerTime == null ? null : registerTime,
        "active": active,
        "account": account,
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
        email1: json["email1"] == null ? null : json["email1"],
        email2: json["email2"] == null ? null : json["email2"],
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
        "email1": email1 == null ? null : email1,
        "email2": email2 == null ? null : email2,
        "note": note,
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
