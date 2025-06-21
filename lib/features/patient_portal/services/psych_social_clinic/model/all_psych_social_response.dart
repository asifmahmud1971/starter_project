class PsychoSocialReportResponse {
  bool? success;
  List<Psychosocial>? psychosocial;
  String? token;
  String? tokenType;

  PsychoSocialReportResponse(
      {this.success, this.psychosocial, this.token, this.tokenType});

  PsychoSocialReportResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['psychosocial'] != null) {
      psychosocial = <Psychosocial>[];
      json['psychosocial'].forEach((v) {
        psychosocial!.add(new Psychosocial.fromJson(v));
      });
    }
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (psychosocial != null) {
      data['psychosocial'] = psychosocial!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
    data['token_type'] = tokenType;
    return data;
  }
}

class Psychosocial {
  int? id;
  String? companyId;
  String? patientId;
  String? date;
  String? anxiousOrWorried;
  String? familyAnxiousOrWorried;
  String? feelingDepressed;
  String? feltAtPeace;
  String? shareFeeling;
  String? muchInformation;
  String? createdAt;
  String? updatedAt;

  Psychosocial(
      {this.id,
        this.companyId,
        this.patientId,
        this.date,
        this.anxiousOrWorried,
        this.familyAnxiousOrWorried,
        this.feelingDepressed,
        this.feltAtPeace,
        this.shareFeeling,
        this.muchInformation,
        this.createdAt,
        this.updatedAt});

  Psychosocial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    patientId = json['patient_id'];
    date = json['date'];
    anxiousOrWorried = json['anxious_or_worried'];
    familyAnxiousOrWorried = json['family_anxious_or_worried'];
    feelingDepressed = json['feeling_depressed'];
    feltAtPeace = json['felt_at_peace'];
    shareFeeling = json['share_feeling'];
    muchInformation = json['much_information'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['patient_id'] = patientId;
    data['date'] = date;
    data['anxious_or_worried'] = anxiousOrWorried;
    data['family_anxious_or_worried'] = familyAnxiousOrWorried;
    data['feeling_depressed'] = feelingDepressed;
    data['felt_at_peace'] = feltAtPeace;
    data['share_feeling'] = shareFeeling;
    data['much_information'] = muchInformation;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
