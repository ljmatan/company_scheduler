class Contact {
  int id;
  String name;
  Address address;
  Client client;
  ClientType contactType;
  int account;
  Null attributes;

  Contact(
      {this.id,
        this.name,
        this.address,
        this.client,
        this.contactType,
        this.account,
        this.attributes});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
    contactType = json['contactType'] != null
        ? new ClientType.fromJson(json['contactType'])
        : null;
    account = json['account'];
    attributes = json['attributes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client.toJson();
    }
    if (this.contactType != null) {
      data['contactType'] = this.contactType.toJson();
    }
    data['account'] = this.account;
    data['attributes'] = this.attributes;
    return data;
  }
}

class Address {
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

  Address(
      {this.id,
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
        this.note});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    street = json['street'];
    city = json['city'];
    houseno = json['houseno'];
    flatno = json['flatno'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    mobile1 = json['mobile1'];
    mobile2 = json['mobile2'];
    email1 = json['email1'];
    email2 = json['email2'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['street'] = this.street;
    data['city'] = this.city;
    data['houseno'] = this.houseno;
    data['flatno'] = this.flatno;
    data['phone1'] = this.phone1;
    data['phone2'] = this.phone2;
    data['mobile1'] = this.mobile1;
    data['mobile2'] = this.mobile2;
    data['email1'] = this.email1;
    data['email2'] = this.email2;
    data['note'] = this.note;
    return data;
  }
}

class Client {
  int id;
  String name;
  int account;
  ClientType clientType;
  Address address;
  Null clientTypeDTO;

  Client(
      {this.id,
        this.name,
        this.account,
        this.clientType,
        this.address,
        this.clientTypeDTO});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    account = json['account'];
    clientType = json['clientType'] != null
        ? new ClientType.fromJson(json['clientType'])
        : null;
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    clientTypeDTO = json['clientTypeDTO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['account'] = this.account;
    if (this.clientType != null) {
      data['clientType'] = this.clientType.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['clientTypeDTO'] = this.clientTypeDTO;
    return data;
  }
}

class ClientType {
  int id;
  String name;
  bool active;
  int account;

  ClientType({this.id, this.name, this.active, this.account});

  ClientType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    active = json['active'];
    account = json['account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['active'] = this.active;
    data['account'] = this.account;
    return data;
  }
}
