import 'package:medPilot/features/patient_portal/services/wound_clinic/model/wound_data.dart';

class AllWoundData {
  AllWoundData({
      this.success, 
      this.woundAssessment, 
      this.token, 
      this.tokenType,});

  AllWoundData.fromJson(dynamic json) {
    success = json['success'];
    if (json['wound_assessment'] != null) {
      woundAssessment = [];
      json['wound_assessment'].forEach((v) {
        woundAssessment?.add(WoundData.fromJson(v));
      });
    }
    token = json['token'];
    tokenType = json['token_type'];
  }
  bool? success;
  List<WoundData>? woundAssessment;
  String? token;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (woundAssessment != null) {
      map['wound_assessment'] = woundAssessment?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    map['token_type'] = tokenType;
    return map;
  }

}
