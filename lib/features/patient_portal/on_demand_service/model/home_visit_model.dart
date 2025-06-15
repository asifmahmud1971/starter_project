import 'package:medPilot/core/constants/strings.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/product.dart';

class HomeVisitModel {
  HomeVisitModel({
      this.success, 
      this.product,
      this.token, 
      this.tokenType,});

  HomeVisitModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      product = [];
      json['data'].forEach((v) {
        product?.add(Product.fromJson(v));
      });
    }
    token = json['token'];
    tokenType = json['token_type'];
  }
  bool? success;
  List<Product>? product;
  String? token;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (product != null) {
      map['data'] = product?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    map['token_type'] = tokenType;
    return map;
  }

}

