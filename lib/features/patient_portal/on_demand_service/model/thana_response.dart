class ThanaResponse {
  bool? success;
  List<Thana>? thana;

  ThanaResponse({this.success, this.thana});

  ThanaResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['thana'] != null) {
      thana = <Thana>[];
      json['thana'].forEach((v) {
        thana!.add(new Thana.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (thana != null) {
      data['thana'] = thana!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Thana {
  int? id;
  String? companyId;
  String? cityId;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  Thana(
      {this.id,
        this.companyId,
        this.cityId,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt});

  Thana.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    cityId = json['city_id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['city_id'] = cityId;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
