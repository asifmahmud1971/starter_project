import 'package:medPilot/features/staff_portal/medicine_alert/model/medicine_alert_model.dart';

class MedicineAlertGiven {
  MedicineAlertGiven({
    this.success,
    this.message,
    this.data,
    this.token,
    this.tokenType,
  });

  MedicineAlertGiven.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? MedicineAlertStatus.fromJson(json['data'])
        : null;
    token = json['token'];
    tokenType = json['token_type'];
  }

  bool? success;
  String? message;
  MedicineAlertStatus? data;
  String? token;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['token'] = token;
    map['token_type'] = tokenType;
    return map;
  }
}
