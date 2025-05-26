class MedicationModel {
  MedicationModel({
    this.success,
    this.painMedications,
    this.token,
    this.tokenType,});

  MedicationModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['pain_medications'] != null) {
      painMedications = [];
      json['pain_medications'].forEach((v) {
        painMedications?.add(PainMedications.fromJson(v));
      });
    }
    token = json['token'];
    tokenType = json['token_type'];
  }
  bool? success;
  List<PainMedications>? painMedications;
  String? token;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (painMedications != null) {
      map['pain_medications'] = painMedications?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    map['token_type'] = tokenType;
    return map;
  }

}

class PainMedications {
  PainMedications({
    this.name,
    this.dose,
    this.note,
    this.duration,
    this.chart,});

  PainMedications.fromJson(dynamic json) {
    name = json['name'];
    dose = json['dose'];
    note = json['note'];
    duration = json['duration'];
    if (json['chart'] != null) {
      chart = [];
      json['chart'].forEach((v) {
        chart?.add(Chart.fromJson(v));
      });
    }
  }
  String? name;
  String? dose;
  String? note;
  String? duration;
  List<Chart>? chart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['dose'] = dose;
    map['note'] = note;
    map['duration'] = duration;
    if (chart != null) {
      map['chart'] = chart?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Chart {
  Chart({
    this.date,
    this.time,
    this.taken,});

  Chart.fromJson(dynamic json) {
    date = json['date'];
    time = json['time'];
    taken = json['taken'];
  }
  String? date;
  String? time;
  String? taken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['time'] = time;
    map['taken'] = taken;
    return map;
  }

}