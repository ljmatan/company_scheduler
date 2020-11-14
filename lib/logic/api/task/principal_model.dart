class Principal {
  Principal({
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
  Account account;
  String createdDate;
  String lastLogin;
  Type type;

  factory Principal.fromJson(Map<String, dynamic> json) => Principal(
        entityManager: json["entityManager"],
        id: json["id"],
        name: json["name"],
        username: json["username"],
        password: json["password"],
        parent: json["parent"],
        account:
            json["account"] == null ? null : Account.fromJson(json["account"]),
        createdDate: json["createdDate"] == null ? null : json["createdDate"],
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
        "account": account == null ? null : account.toJson(),
        "createdDate": createdDate == null ? null : createdDate,
        "lastLogin": lastLogin == null ? null : lastLogin,
        "type": typeValues.reverse[type],
      };
}

class Account {
  Account({
    this.entityManager,
    this.id,
    this.name,
    this.registerTime,
    this.active,
  });

  dynamic entityManager;
  int id;
  Name name;
  String registerTime;
  bool active;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        entityManager: json["entityManager"],
        id: json["id"],
        name: nameValues.map[json["name"]],
        registerTime: json["registerTime"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "entityManager": entityManager,
        "id": id,
        "name": nameValues.reverse[name],
        "registerTime": registerTime,
        "active": active,
      };
}

enum Name { INPUT_DOO }

final nameValues = EnumValues({"Input doo": Name.INPUT_DOO});

enum Type { USER, POSTGRES, KORISNIK }

final typeValues = EnumValues(
    {"Korisnik": Type.KORISNIK, "postgres": Type.POSTGRES, "user": Type.USER});

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
