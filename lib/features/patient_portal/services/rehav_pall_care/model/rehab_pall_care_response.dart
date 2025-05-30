class RehabPallCareResponse {
  bool? success;
  List<RehabilitativePallMenu>? rehabilitativePallMenu;
  String? token;
  String? tokenType;

  RehabPallCareResponse(
      {this.success, this.rehabilitativePallMenu, this.token, this.tokenType});

  RehabPallCareResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['rehabilitative_pall_menu'] != null) {
      rehabilitativePallMenu = <RehabilitativePallMenu>[];
      json['rehabilitative_pall_menu'].forEach((v) {
        rehabilitativePallMenu!.add(new RehabilitativePallMenu.fromJson(v));
      });
    }
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.rehabilitativePallMenu != null) {
      data['rehabilitative_pall_menu'] =
          this.rehabilitativePallMenu!.map((v) => v.toJson()).toList();
    }
    data['token'] = this.token;
    data['token_type'] = this.tokenType;
    return data;
  }
}

class RehabilitativePallMenu {
  int? id;
  String? companyId;
  String? menuName;
  String? image;
  Null? status;
  String? createdAt;
  String? updatedAt;

  RehabilitativePallMenu(
      {this.id,
        this.companyId,
        this.menuName,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  RehabilitativePallMenu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    menuName = json['menu_name'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.companyId;
    data['menu_name'] = this.menuName;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
