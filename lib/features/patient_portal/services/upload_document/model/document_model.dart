import '../../../../../core/constants/strings.dart';

class DocumentModel {
  DocumentModel({
      this.success, 
      this.uploadDocument, 
      this.token, 
      this.tokenType,});

  DocumentModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['upload_document'] != null) {
      uploadDocument = [];
      json['upload_document'].forEach((v) {
        uploadDocument?.add(UploadDocument.fromJson(v));
      });
    }
    token = json['token'];
    tokenType = json['token_type'];
  }
  bool? success;
  List<UploadDocument>? uploadDocument;
  String? token;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (uploadDocument != null) {
      map['upload_document'] = uploadDocument?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    map['token_type'] = tokenType;
    return map;
  }

}

class UploadDocument {
  UploadDocument({
      this.id, 
      this.companyId, 
      this.patientId, 
      this.date, 
      this.title, 
      this.file, 
      this.submit, 
      this.createdAt, 
      this.updatedAt,});

  UploadDocument.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    patientId = json['patient_id'];
    date = json['date'];
    title = json['title'];
    file = appBaseUrl+json['file'];
    submit = json['submit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? companyId;
  String? patientId;
  String? date;
  String? title;
  String? file;
  String? submit;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['patient_id'] = patientId;
    map['date'] = date;
    map['title'] = title;
    map['file'] = file;
    map['submit'] = submit;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}