import 'user.dart';

class LoginResponse {
  LoginResponse({
    this.message,
    this.tokenType,
    this.token,
    this.user,
    this.loginPortal,
    this.myPackage,
    this.notification,
  });

  LoginResponse.fromJson(dynamic json) {
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
