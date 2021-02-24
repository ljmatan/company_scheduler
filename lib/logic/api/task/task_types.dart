class TaskType {
  int id;
  String name;
  String taskTypeType;
  int account;

  TaskType({this.id, this.name, this.taskTypeType, this.account});

  TaskType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    taskTypeType = json['taskTypeType'];
    account = json['account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['taskTypeType'] = this.taskTypeType;
    data['account'] = this.account;
    return data;
  }
}