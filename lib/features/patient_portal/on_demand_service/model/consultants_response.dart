class ConsultantsResponse {
  bool? success;
  List<DoctorList>? doctorList;
  String? token;
  String? tokenType;

  ConsultantsResponse(
      {this.success, this.doctorList, this.token, this.tokenType});

  ConsultantsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['doctor_list'] != null) {
      doctorList = <DoctorList>[];
      json['doctor_list'].forEach((v) {
        doctorList!.add(new DoctorList.fromJson(v));
      });
    }
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (doctorList != null) {
      data['doctor_list'] = doctorList!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
    data['token_type'] = tokenType;
    return data;
  }
}

class DoctorList {
  int? id;
  String? companyId;
  String? name;
  String? type;
  String? description;
  String? status;
  String? image;
  String? createdAt;
  String? updatedAt;

  DoctorList(
      {this.id,
        this.companyId,
        this.name,
        this.type,
        this.description,
        this.status,
        this.image,
        this.createdAt,
        this.updatedAt});

  DoctorList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    type = json['type'];
    description = json['description'];
    status = json['status'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['name'] = name;
    data['type'] = type;
    data['description'] = description;
    data['status'] = status;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
