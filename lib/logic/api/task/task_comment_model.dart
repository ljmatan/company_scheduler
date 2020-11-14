class TaskComment {
  TaskComment({
    this.entityManager,
    this.id,
    this.comment,
    this.createdTime,
    this.commentTime,
    this.hoursWorked,
    this.principal,
  });

  dynamic entityManager;
  int id;
  String comment;
  int createdTime;
  int commentTime;
  double hoursWorked;
  Principal principal;

  factory TaskComment.fromJson(Map<String, dynamic> json) => TaskComment(
        entityManager: json["entityManager"],
        id: json["id"],
        comment: json["comment"],
        createdTime: json["createdTime"],
        commentTime: json["commentTime"],
        hoursWorked: json["hoursWorked"],
        principal: Principal.fromJson(json["principal"]),
      );

  Map<String, dynamic> toJson() => {
        "entityManager": entityManager,
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
  dynamic lastLogin;
  String type;

  factory Principal.fromJson(Map<String, dynamic> json) => Principal(
        entityManager: json["entityManager"],
        id: json["id"],
        name: json["name"],
        username: json["username"],
        password: json["password"],
        parent: json["parent"],
        account: Account.fromJson(json["account"]),
        createdDate: json["createdDate"],
        lastLogin: json["lastLogin"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "entityManager": entityManager,
        "id": id,
        "name": name,
        "username": username,
        "password": password,
        "parent": parent,
        "account": account.toJson(),
        "createdDate": createdDate,
        "lastLogin": lastLogin,
        "type": type,
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
  String name;
  String registerTime;
  bool active;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        entityManager: json["entityManager"],
        id: json["id"],
        name: json["name"],
        registerTime: json["registerTime"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "entityManager": entityManager,
        "id": id,
        "name": name,
        "registerTime": registerTime,
        "active": active,
      };
}
