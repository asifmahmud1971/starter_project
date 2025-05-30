import 'user.dart';

class LoginResponse {
  LoginResponse({
      this.message, 
      this.tokenType, 
      this.token, 
      this.user,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    tokenType = json['token_type'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? message;
  String? tokenType;
  String? token;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token_type'] = tokenType;
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}