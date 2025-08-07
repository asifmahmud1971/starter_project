class Test {
  Test({
      this.message, 
      this.tokenType, 
      this.token, 
      this.user, 
      this.loginPortal, 
      this.myPackage, 
      this.notification,});

  Test.fromJson(dynamic json) {
    message = json['message'];
    tokenType = json['token_type'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    loginPortal = json['login_portal'];
    if (json['myPackage'] != null) {
      myPackage = [];
      json['myPackage'].forEach((v) {
        myPackage?.add(MyPackage.fromJson(v));
      });
    }
    notification = json['notification'] != null ? Notification.fromJson(json['notification']) : null;
  }
  String? message;
  String? tokenType;
  String? token;
  User? user;
  String? loginPortal;
  List<MyPackage>? myPackage;
  Notification? notification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token_type'] = tokenType;
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['login_portal'] = loginPortal;
    if (myPackage != null) {
      map['myPackage'] = myPackage?.map((v) => v.toJson()).toList();
    }
    if (notification != null) {
      map['notification'] = notification?.toJson();
    }
    return map;
  }

}

class Notification {
  Notification({
      this.unreadNotification,});

  Notification.fromJson(dynamic json) {
    unreadNotification = json['unread_notification'];
  }
  num? unreadNotification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['unread_notification'] = unreadNotification;
    return map;
  }

}

class MyPackage {
  MyPackage({
      this.homePackage,});

  MyPackage.fromJson(dynamic json) {
    homePackage = json['home_package'];
  }
  dynamic homePackage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['home_package'] = homePackage;
    return map;
  }

}

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
      this.branchId, 
      this.subscriberId, 
      this.depertment, 
      this.address, 
      this.createdAt, 
      this.updatedAt,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    userType = json['user_type'];
    status = json['status'];
    roleId = json['role_id'];
    branchId = json['branch_id'] != null ? json['branch_id'].cast<String>() : [];
    subscriberId = json['subscriber_id'];
    depertment = json['depertment'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? name;
  String? email;
  String? phone;
  String? emailVerifiedAt;
  String? userType;
  String? status;
  String? roleId;
  List<String>? branchId;
  String? subscriberId;
  String? depertment;
  String? address;
  String? createdAt;
  String? updatedAt;

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
    map['branch_id'] = branchId;
    map['subscriber_id'] = subscriberId;
    map['depertment'] = depertment;
    map['address'] = address;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}