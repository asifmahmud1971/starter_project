import 'package:medPilot/features/staff_portal/task/model/task_model.dart';

class TaskData {
  TaskData({
    this.success,
    this.token,
    this.tokenType,
    this.data,
  });

  TaskData.fromJson(dynamic json) {
    success = json['success'];
    token = json['token'];
    tokenType = json['token_type'];
    data = json['data'] != null ? StaffTasks.fromJson(json['data']) : null;
  }

  bool? success;
  String? token;
  String? tokenType;
  StaffTasks? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['token'] = token;
    map['token_type'] = tokenType;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}
