import 'package:medPilot/core/constants/strings.dart';

class Product {
  Product({
    this.id,
    this.companyId,
    this.cityId,
    this.projectId,
    this.incomeHeadId,
    this.incomeSubcategoryId,
    this.image,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.productName,
    this.price,
  });

  Product.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    cityId = json['city_id'];
    projectId = json['project_id'];
    incomeHeadId = json['income_head_id'];
    incomeSubcategoryId = json['income_subcategory_id'];
    image = appBaseUrl+json['image'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productName = json['product_name'];
    price = json['price'];
  }
  num? id;
  String? companyId;
  dynamic cityId;
  dynamic projectId;
  dynamic incomeHeadId;
  String? incomeSubcategoryId;
  String? image;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? productName;
  String? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['city_id'] = cityId;
    map['project_id'] = projectId;
    map['income_head_id'] = incomeHeadId;
    map['income_subcategory_id'] = incomeSubcategoryId;
    map['image'] = image;
    map['description'] = description;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['product_name'] = productName;
    map['price'] = price;
    return map;
  }

}