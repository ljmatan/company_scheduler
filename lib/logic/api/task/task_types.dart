class TaskType {
  TaskType({
    this.id,
    this.name,
    this.account,
  });

  int id;
  String name;
  Account account;

  factory TaskType.fromJson(Map<String, dynamic> json) => TaskType(
        id: json["id"],
        name: json["name"],
        account: Account.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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
