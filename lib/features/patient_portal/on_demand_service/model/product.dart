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
    this.productId,
    this.categoryId,
    this.type
  });

  Product.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    cityId = json['city_id'];
    projectId = json['project_id'];
    incomeHeadId = json['income_head_id'];
    incomeSubcategoryId = json['income_subcategory_id'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productName = json['product_name'];
    price = json['price'];
    productId = json['product_id'];
    categoryId = json['category_id'];
    type = json['type'];
  }
  int? id;
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
  int? productId;
  String? categoryId;
  String? type;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['city_id'] = cityId;
    data['project_id'] = projectId;
    data['income_head_id'] = incomeHeadId;
    data['income_subcategory_id'] = incomeSubcategoryId;
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['product_name'] = productName;
    data['price'] = price;
    data['product_id'] = productId;
    data['category_id'] = categoryId;
    data['type'] = type;
    return data;
  }

}