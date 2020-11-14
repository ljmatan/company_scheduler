class TaskSubject {
  TaskSubject({
    this.id,
    this.name,
    this.type,
    this.account,
  });

  int id;
  String name;
  TaskSubject type;
  Account account;

  factory TaskSubject.fromJson(Map<String, dynamic> json) => TaskSubject(
        id: json["id"],
        name: json["name"],
        type: json["type"] == null ? null : TaskSubject.fromJson(json["type"]),
        account: Account.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type == null ? null : type.toJson(),
        "account": account.toJson(),
      };
}

class Account {
  Account({
    this.id,
    this.name,
    this.registerTime,
    this.active,
  });

  int id;
  String name;
  String registerTime;
  bool active;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        name: json["name"],
        registerTime: json["registerTime"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "registerTime": registerTime,
        "active": active,
      };
}
