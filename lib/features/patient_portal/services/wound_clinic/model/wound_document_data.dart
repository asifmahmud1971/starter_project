import 'package:medPilot/features/patient_portal/services/wound_clinic/model/wound_data.dart';

class WoundDocumentData {
  WoundDocumentData({
    this.success,
    this.savedData,
    this.token,
    this.tokenType,});

  WoundDocumentData.fromJson(dynamic json) {
    success = json['success'];
    savedData = json['saved_data'] != null ? WoundData.fromJson(json['saved_data']) : null;
    token = json['token'];
    tokenType = json['token_type'];
  }
  bool? success;
  WoundData? savedData;
  String? token;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (savedData != null) {
      map['saved_data'] = savedData?.toJson();
    }
    map['token'] = token;
    map['token_type'] = tokenType;
    return map;
  }

}
