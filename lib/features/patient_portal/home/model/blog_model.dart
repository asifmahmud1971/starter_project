import 'package:medPilot/core/constants/strings.dart';
import 'package:medPilot/data/network/api_urls.dart';

class BlogModel {
  BlogModel({
      this.success, 
      this.data, 
      this.token, 
      this.tokenType,});

  BlogModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BlogData.fromJson(v));
      });
    }
    token = json['token'];
    tokenType = json['token_type'];
  }
  bool? success;
  List<BlogData>? data;
  String? token;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    map['token_type'] = tokenType;
    return map;
  }

}

class BlogData {
  BlogData({
      this.companyId, 
      this.id, 
      this.title, 
      this.description, 
      this.image, 
      this.date, 
      this.status, 
      this.createdBy, 
      this.createdAt, 
      this.updatedAt,});

  BlogData.fromJson(dynamic json) {
    companyId = json['company_id'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = appBaseUrl+ json['image'];
    date = json['date'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? companyId;
  num? id;
  String? title;
  String? description;
  String? image;
  String? date;
  String? status;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_id'] = companyId;
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['image'] = image;
    map['date'] = date;
    map['status'] = status;
    map['created_by'] = createdBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}