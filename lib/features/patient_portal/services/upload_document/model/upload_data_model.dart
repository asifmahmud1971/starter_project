class UploadDataModel {
  bool? success;
  SavedData? savedData;
  String? token;
  String? tokenType;

  UploadDataModel({this.success, this.savedData, this.token, this.tokenType});

  UploadDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    savedData = json['saved_data'] != null
        ? new SavedData.fromJson(json['saved_data'])
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
  int? patientId;
  String? companyId;
  String? title;
  String? date;
  String? file;
  int? submit;
  String? updatedAt;
  String? createdAt;
  int? id;

  SavedData(
      {this.patientId,
        this.companyId,
        this.title,
        this.date,
        this.file,
        this.submit,
        this.updatedAt,
        this.createdAt,
        this.id});

  SavedData.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    companyId = json['company_id'];
    title = json['title'];
    date = json['date'];
    file = json['file'];
    submit = json['submit'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patient_id'] = patientId;
    data['company_id'] = companyId;
    data['title'] = title;
    data['date'] = date;
    data['file'] = file;
    data['submit'] = submit;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}