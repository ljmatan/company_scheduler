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
  int account;

  factory TaskSubject.fromJson(Map<String, dynamic> json) => TaskSubject(
        id: json["id"],
        name: json["name"],
        type: json["type"] == null ? null : TaskSubject.fromJson(json["type"]),
        account: json["account"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type == null ? null : type.toJson(),
        "account": account,
      };
}
