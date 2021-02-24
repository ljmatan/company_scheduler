class Company {
  Company({
    this.id,
    this.name,
    this.account,
    this.clientType,
    this.address,
    this.clientTypeDto,
  });

  int id;
  String name;
  int account;
  Account clientType;
  Address address;
  dynamic clientTypeDto;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        account: json["account"],
        clientType: Account.fromJson(json["clientType"]),
        address: Address.fromJson(json["address"]),
        clientTypeDto: json["clientTypeDTO"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "account": account,
        "clientType": clientType.toJson(),
        "address": address.toJson(),
        "clientTypeDTO": clientTypeDto,
      };
}

class Account {
  Account({
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
  int account;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        name: json["name"],
        registerTime:
            json["registerTime"] == null ? null : json["registerTime"],
        active: json["active"],
        account: json["account"] == null ? null : json["account"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "registerTime": registerTime == null ? null : registerTime,
        "active": active,
        "account": account == null ? null : account,
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
  String email1;
  String email2;
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
