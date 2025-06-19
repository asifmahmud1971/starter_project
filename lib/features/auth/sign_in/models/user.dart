class User {
  User({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.emailVerifiedAt, 
      this.userType, 
      this.status, 
      this.roleId, 
      this.package, 
      this.companyId, 
      this.branchId, 
      this.depertment, 
      this.address, 
      this.createdAt, 
      this.updatedAt, 
      this.activeStatus, 
      this.avatar, 
      this.darkMode, 
      this.messengerColor,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    userType = json['user_type'];
    status = json['status'];
    roleId = json['role_id'];
    package = json['package'];
    companyId = json['company_id'];
    branchId = json['branch_id'];
    depertment = json['depertment'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    activeStatus = json['active_status'];
    avatar = json['avatar'];
    darkMode = json['dark_mode'];
    messengerColor = json['messenger_color'];
  }
  dynamic id;
  String? name;
  String? email;
  String? phone;
  String? emailVerifiedAt;
  String? userType;
  String? status;
  dynamic roleId;
  String? package;
  String? companyId;
  String? branchId;
  String? depertment;
  String? address;
  String? createdAt;
  String? updatedAt;
  dynamic activeStatus;
  String? avatar;
  dynamic darkMode;
  String? messengerColor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['email_verified_at'] = emailVerifiedAt;
    map['user_type'] = userType;
    map['status'] = status;
    map['role_id'] = roleId;
    map['package'] = package;
    map['company_id'] = companyId;
    map['branch_id'] = branchId;
    map['depertment'] = depertment;
    map['address'] = address;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['active_status'] = activeStatus;
    map['avatar'] = avatar;
    map['dark_mode'] = darkMode;
    map['messenger_color'] = messengerColor;
    return map;
  }

}