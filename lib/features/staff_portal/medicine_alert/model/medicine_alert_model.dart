class MedicineAlertModel {
  MedicineAlertModel({
    this.success,
    this.token,
    this.tokenType,
    this.alerts,
  });

  MedicineAlertModel.fromJson(dynamic json) {
    success = json['success'];
    token = json['token'];
    tokenType = json['token_type'];
    if (json['alerts'] != null) {
      alerts = [];
      json['alerts'].forEach((v) {
        alerts?.add(Alerts.fromJson(v));
      });
    }
  }

  bool? success;
  String? token;
  String? tokenType;
  List<Alerts>? alerts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['token'] = token;
    map['token_type'] = tokenType;
    if (alerts != null) {
      map['alerts'] = alerts?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Alerts {
  Alerts({
    this.medicine,
    this.dose,
    this.time,
    this.status,
    this.actions,
  });

  Alerts.fromJson(dynamic json) {
    medicine = json['medicine'];
    dose = json['dose'];
    time = json['time'];
    status = json['status'] != null ? MedicineAlertStatus.fromJson(json['status']) : null;
    actions =
    json['actions'] != null ? MedicineAlertActions.fromJson(json['actions']) : null;
  }

  String? medicine;
  String? dose;
  String? time;
  MedicineAlertStatus? status;
  MedicineAlertActions? actions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['medicine'] = medicine;
    map['dose'] = dose;
    map['time'] = time;
    if (status != null) {
      map['status'] = status?.toJson();
    }
    if (actions != null) {
      map['actions'] = actions?.toJson();
    }
    return map;
  }
}

class MedicineAlertActions {
  MedicineAlertActions({
    this.givenUrl,
    this.notGivenUrl,
  });

  MedicineAlertActions.fromJson(dynamic json) {
    givenUrl = json['given_url'];
    notGivenUrl = json['not_given_url'];
  }

  String? givenUrl;
  String? notGivenUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['given_url'] = givenUrl;
    map['not_given_url'] = notGivenUrl;
    return map;
  }
}

class MedicineAlertStatus {
  MedicineAlertStatus({
    this.id,
    this.patientId,
    this.medicineId,
    this.taskId,
    this.date,
    this.staffId,
    this.yes,
    this.no,
    this.createdAt,
    this.updatedAt,
  });

  MedicineAlertStatus.fromJson(dynamic json) {
    id = json['id'];
    patientId = json['patient_id'];
    medicineId = json['medicine_id'];
    taskId = json['task_id'];
    date = json['date'];
    staffId = json['staff_id'];
    yes = json['yes'];
    no = json['no'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  String? patientId;
  String? medicineId;
  String? taskId;
  String? date;
  String? staffId;
  String? yes;
  dynamic no;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['patient_id'] = patientId;
    map['medicine_id'] = medicineId;
    map['task_id'] = taskId;
    map['date'] = date;
    map['staff_id'] = staffId;
    map['yes'] = yes;
    map['no'] = no;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
