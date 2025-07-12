class TaskModel {
  TaskModel({
      this.success, 
      this.token, 
      this.tokenType, 
      this.tasks,});

  TaskModel.fromJson(dynamic json) {
    success = json['success'];
    token = json['token'];
    tokenType = json['token_type'];
    if (json['tasks'] != null) {
      tasks = [];
      json['tasks'].forEach((v) {
        tasks?.add(StaffTasks.fromJson(v));
      });
    }
  }
  bool? success;
  String? token;
  String? tokenType;
  List<StaffTasks>? tasks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['token'] = token;
    map['token_type'] = tokenType;
    if (tasks != null) {
      map['tasks'] = tasks?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class StaffTasks {
  StaffTasks({
      this.taskId, 
      this.title, 
      this.description, 
      this.assignDate, 
      this.lastDate, 
      this.status, 
      this.statusOptions,});

  StaffTasks.fromJson(dynamic json) {
    taskId = json['task_id'];
    title = json['title'];
    description = json['description'];
    assignDate = json['assign_date'];
    lastDate = json['last_date'];
    status = json['status'];
    if (json['status_options'] != null) {
      statusOptions = [];
      json['status_options'].forEach((v) {
        statusOptions?.add(StatusOptions.fromJson(v));
      });
    }
  }
  num? taskId;
  String? title;
  String? description;
  String? assignDate;
  String? lastDate;
  String? status;
  List<StatusOptions>? statusOptions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['task_id'] = taskId;
    map['title'] = title;
    map['description'] = description;
    map['assign_date'] = assignDate;
    map['last_date'] = lastDate;
    map['status'] = status;
    if (statusOptions != null) {
      map['status_options'] = statusOptions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
  StatusOptions? get selectedStatusOption =>
      statusOptions?.firstWhere((o) => o.selected??false, orElse: () => statusOptions?[0]??StatusOptions());

}

class StatusOptions {
  StatusOptions({
      this.label, 
      this.value, 
      this.url, 
      this.selected,});

  StatusOptions.fromJson(dynamic json) {
    label = json['label'];
    value = json['value'];
    url = json['url'];
    selected = json['selected'];
  }
  String? label;
  num? value;
  String? url;
  bool? selected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['value'] = value;
    map['url'] = url;
    map['selected'] = selected;
    return map;
  }

}