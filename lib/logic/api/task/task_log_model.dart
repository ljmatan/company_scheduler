class TaskLog {
  int id;
  int taskLogTime;
  Principal principal;
  String description;

  TaskLog({this.id, this.taskLogTime, this.principal, this.description});

  TaskLog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskLogTime = json['taskLogTime'];
    principal = json['principal'] != null
        ? new Principal.fromJson(json['principal'])
        : null;
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['taskLogTime'] = this.taskLogTime;
    if (this.principal != null) {
      data['principal'] = this.principal.toJson();
    }
    data['description'] = this.description;
    return data;
  }
}

class Principal {
  int id;
  String name;
  String username;
  Null parent;
  String type;

  Principal({this.id, this.name, this.username, this.parent, this.type});

  Principal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    parent = json['parent'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['parent'] = this.parent;
    data['type'] = this.type;
    return data;
  }
}
