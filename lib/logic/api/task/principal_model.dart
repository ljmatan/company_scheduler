class Principal {
  Principal({
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

  int id;
  String name;
  String username;
  String password;
  dynamic parent;
  int account;
  String createdDate;
  String lastLogin;
  Type type;

  factory Principal.fromJson(Map<String, dynamic> json) => Principal(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        password: json["password"],
        parent: json["parent"],
        account: json["account"],
        createdDate: json["createdDate"] == null ? null : json["createdDate"],
        lastLogin: json["lastLogin"] == null ? null : json["lastLogin"],
        type: typeValues.map[json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "password": password,
        "parent": parent,
        "account": account ,
        "createdDate": createdDate == null ? null : createdDate,
        "lastLogin": lastLogin == null ? null : lastLogin,
        "type": typeValues.reverse[type],
      };
}


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
