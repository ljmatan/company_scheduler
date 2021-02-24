class TaskComment {
  TaskComment({
    this.id,
    this.comment,
    this.createdTime,
    this.commentTime,
    this.hoursWorked,
    this.principal,
  });

  int id;
  String comment;
  int createdTime;
  int commentTime;
  double hoursWorked;
  Principal principal;

  factory TaskComment.fromJson(Map<String, dynamic> json) => TaskComment(
        id: json["id"],
        comment: json["comment"],
        createdTime: json["createdTime"],
        commentTime: json["commentTime"],
        hoursWorked: json["hoursWorked"],
        principal: Principal.fromJson(json["principal"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "createdTime": createdTime,
        "commentTime": commentTime,
        "hoursWorked": hoursWorked,
        "principal": principal.toJson(),
      };
}

class Principal {
  Principal({
    this.id,
    this.name,
    this.username,
    this.parent,

    this.type,
  });

  int id;
  String name;
  String username;
  dynamic parent;
  String type;

  factory Principal.fromJson(Map<String, dynamic> json) => Principal(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        parent: json["parent"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "parent": parent,
        "type": type,
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
