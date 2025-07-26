class TelePackageResponse {
  bool? success;
  List<Packages>? packages;

  TelePackageResponse({this.success, this.packages});

  TelePackageResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (packages != null) {
      data['packages'] = packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Packages {
  int? id;
  String? companyId;
  String? name;
  String? subCategoryId;
  String? fromTime;
  String? endTime;
  String? price;
  Null? status;
  String? createdAt;
  String? updatedAt;

  Packages(
      {this.id,
      this.companyId,
      this.name,
      this.subCategoryId,
      this.fromTime,
      this.endTime,
      this.price,
      this.status,
      this.createdAt,
      this.updatedAt});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    subCategoryId = json['sub_category_id'];
    fromTime = json['from_time'];
    endTime = json['end_time'];
    price = json['price'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['name'] = name;
    data['sub_category_id'] = subCategoryId;
    data['from_time'] = fromTime;
    data['end_time'] = endTime;
    data['price'] = price;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
