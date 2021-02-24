class TaskDetails {
  int id;
  String name;
  String description;
  Parent parent;
  String dtype;
  int createdTime;
  int startTime;
  int endTime;
  Creator creator;
  Type type;
  Subject subject;
  int percent;
  int priority;
  Status status;
  Project project;
  Client client;
  Contact contact;
  int account;
  List<TaskPrincipals> taskPrincipals;
  String principalsAsString;

  TaskDetails(
      {this.id,
        this.name,
        this.description,
        this.parent,
        this.dtype,
        this.createdTime,
        this.startTime,
        this.endTime,
        this.creator,
        this.type,
        this.subject,
        this.percent,
        this.priority,
        this.status,
        this.project,
        this.client,
        this.contact,
        this.account,
        this.taskPrincipals,
        this.principalsAsString});

  TaskDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    parent =
    json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    dtype = json['dtype'];
    createdTime = json['createdTime'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    creator =
    json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    subject =
    json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
    percent = json['percent'];
    priority = json['priority'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
    contact =
    json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    account = json['account'];
    if (json['taskPrincipals'] != null) {
      taskPrincipals = new List<TaskPrincipals>();
      json['taskPrincipals'].forEach((v) {
        taskPrincipals.add(new TaskPrincipals.fromJson(v));
      });
    }
    principalsAsString = json['principalsAsString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.parent != null) {
      data['parent'] = this.parent.toJson();
    }
    data['dtype'] = this.dtype;
    data['createdTime'] = this.createdTime;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    if (this.subject != null) {
      data['subject'] = this.subject.toJson();
    }
    data['percent'] = this.percent;
    data['priority'] = this.priority;
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    if (this.project != null) {
      data['project'] = this.project.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client.toJson();
    }
    if (this.contact != null) {
      data['contact'] = this.contact.toJson();
    }
    data['account'] = this.account;
    if (this.taskPrincipals != null) {
      data['taskPrincipals'] =
          this.taskPrincipals.map((v) => v.toJson()).toList();
    }
    data['principalsAsString'] = this.principalsAsString;
    return data;
  }
}

class Parent {
  int id;
  String name;
  String description;
  Null parent;
  String dtype;
  int createdTime;
  Null startTime;
  Null endTime;
  Creator creator;
  Type type;
  Null subject;
  int percent;
  int priority;
  Status status;
  Project project;
  Null client;
  Null contact;
  int account;
  List<Null> taskPrincipals;
  String principalsAsString;

  Parent(
      {this.id,
        this.name,
        this.description,
        this.parent,
        this.dtype,
        this.createdTime,
        this.startTime,
        this.endTime,
        this.creator,
        this.type,
        this.subject,
        this.percent,
        this.priority,
        this.status,
        this.project,
        this.client,
        this.contact,
        this.account,
        this.taskPrincipals,
        this.principalsAsString});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    parent = json['parent'];
    dtype = json['dtype'];
    createdTime = json['createdTime'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    creator =
    json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    subject = json['subject'];
    percent = json['percent'];
    priority = json['priority'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
    client = json['client'];
    contact = json['contact'];
    account = json['account'];

    principalsAsString = json['principalsAsString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['parent'] = this.parent;
    data['dtype'] = this.dtype;
    data['createdTime'] = this.createdTime;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    data['subject'] = this.subject;
    data['percent'] = this.percent;
    data['priority'] = this.priority;
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    if (this.project != null) {
      data['project'] = this.project.toJson();
    }
    data['client'] = this.client;
    data['contact'] = this.contact;
    data['account'] = this.account;

    data['principalsAsString'] = this.principalsAsString;
    return data;
  }
}

class Creator {
  int id;
  String name;
  String username;
  Null parent;
  int account;
  String type;

  Creator(
      {this.id,
        this.name,
        this.username,
        this.parent,
        this.account,
        this.type});

  Creator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    parent = json['parent'];
    account = json['account'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['parent'] = this.parent;
    data['account'] = this.account;
    data['type'] = this.type;
    return data;
  }
}

class Type {
  int id;
  String name;
  String taskTypeType;
  int account;

  Type({this.id, this.name, this.taskTypeType, this.account});

  Type.fromJson(Map<String, dynamic> json) {
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

class Status {
  int id;
  String name;
  Type taskType;
  bool opened;
  int defaultFirst;
  int account;

  Status(
      {this.id,
        this.name,
        this.taskType,
        this.opened,
        this.defaultFirst,
        this.account});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    taskType =
    json['taskType'] != null ? new Type.fromJson(json['taskType']) : null;
    opened = json['opened'];
    defaultFirst = json['defaultFirst'];
    account = json['account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.taskType != null) {
      data['taskType'] = this.taskType.toJson();
    }
    data['opened'] = this.opened;
    data['defaultFirst'] = this.defaultFirst;
    data['account'] = this.account;
    return data;
  }
}

class Project {
  int id;
  String name;
  ProjectType projectType;
  Client client;
  ProjectStatus projectStatus;
  int startDate;
  int endDate;
  int account;

  Project(
      {this.id,
        this.name,
        this.projectType,
        this.client,
        this.projectStatus,
        this.startDate,
        this.endDate,
        this.account});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    projectType = json['projectType'] != null
        ? new ProjectType.fromJson(json['projectType'])
        : null;
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
    projectStatus = json['projectStatus'] != null
        ? new ProjectStatus.fromJson(json['projectStatus'])
        : null;
    startDate = json['startDate'];
    endDate = json['endDate'];
    account = json['account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.projectType != null) {
      data['projectType'] = this.projectType.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client.toJson();
    }
    if (this.projectStatus != null) {
      data['projectStatus'] = this.projectStatus.toJson();
    }
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['account'] = this.account;
    return data;
  }
}

class ProjectType {
  int id;
  String name;
  bool active;
  int account;

  ProjectType({this.id, this.name, this.active, this.account});

  ProjectType.fromJson(Map<String, dynamic> json) {
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

class Client {
  int id;
  String name;
  int account;
  ProjectType clientType;
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
        ? new ProjectType.fromJson(json['clientType'])
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

class ProjectStatus {
  int id;
  String name;
  int account;

  ProjectStatus({this.id, this.name, this.account});

  ProjectStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    account = json['account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['account'] = this.account;
    return data;
  }
}

class Subject {
  int id;
  String name;
  Type type;
  int account;

  Subject({this.id, this.name, this.type, this.account});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    account = json['account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    data['account'] = this.account;
    return data;
  }
}

class Contact {
  int id;
  String name;
  Address address;
  Client client;
  ProjectType contactType;
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
        ? new ProjectType.fromJson(json['contactType'])
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

class TaskPrincipals {
  int id;
  Creator principal;
  int account;

  TaskPrincipals({this.id, this.principal, this.account});

  TaskPrincipals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    principal = json['principal'] != null
        ? new Creator.fromJson(json['principal'])
        : null;
    account = json['account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.principal != null) {
      data['principal'] = this.principal.toJson();
    }
    data['account'] = this.account;
    return data;
  }
}
