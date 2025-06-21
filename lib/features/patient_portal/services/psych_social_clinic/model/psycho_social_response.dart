class PsychoSocialResponse {
  bool? success;
  SavedData? savedData;
  String? token;
  String? tokenType;

  PsychoSocialResponse(
      {this.success, this.savedData, this.token, this.tokenType});

  PsychoSocialResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    savedData = json['saved_data'] != null
        ? SavedData.fromJson(json['saved_data'])
        : null;
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (savedData != null) {
      data['saved_data'] = savedData!.toJson();
    }
    data['token'] = token;
    data['token_type'] = tokenType;
    return data;
  }
}

class SavedData {
  String? companyId;
  int? patientId;
  String? date;
  String? anxiousOrWorried;
  String? familyAnxiousOrWorried;
  String? feelingDepressed;
  String? feltAtPeace;
  String? shareFeeling;
  String? muchInformation;
  String? updatedAt;
  String? createdAt;
  int? id;

  SavedData(
      {this.companyId,
        this.patientId,
        this.date,
        this.anxiousOrWorried,
        this.familyAnxiousOrWorried,
        this.feelingDepressed,
        this.feltAtPeace,
        this.shareFeeling,
        this.muchInformation,
        this.updatedAt,
        this.createdAt,
        this.id});

  SavedData.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    patientId = json['patient_id'];
    date = json['date'];
    anxiousOrWorried = json['anxious_or_worried'];
    familyAnxiousOrWorried = json['family_anxious_or_worried'];
    feelingDepressed = json['feeling_depressed'];
    feltAtPeace = json['felt_at_peace'];
    shareFeeling = json['share_feeling'];
    muchInformation = json['much_information'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['company_id'] = companyId;
    data['patient_id'] = patientId;
    data['date'] = date;
    data['anxious_or_worried'] = anxiousOrWorried;
    data['family_anxious_or_worried'] = familyAnxiousOrWorried;
    data['feeling_depressed'] = feelingDepressed;
    data['felt_at_peace'] = feltAtPeace;
    data['share_feeling'] = shareFeeling;
    data['much_information'] = muchInformation;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
