import 'dart:convert';

class LoginResponse {
  UserData? data;
  bool? status;

  LoginResponse({this.data, this.status});

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        data: json["data"] == null ? null : UserData.fromMap(json["data"]),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {"data": data?.toMap(), "status": status};
}

class UserData {
  User? user;
  String? token;

  UserData({this.user, this.token});

  factory UserData.fromJson(String str) => UserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {"user": user?.toMap(), "token": token};
}

class User {
  int? id;
  String? avatarUrl;
  String? name;
  DateTime? dateOfBirth;
  String? gender;
  String? email;
  dynamic language;
  String? createdAt;
  String? preferVoice;
  String? currentPackage;
  bool? isTrialPeriodEnd;
  bool? canAccess;
  DateTime? subscriptionStartAt;
  DateTime? subscriptionEndAt;

  User(
      {this.id,
      this.avatarUrl,
      this.name,
      this.dateOfBirth,
      this.gender,
      this.email,
      this.language,
      this.createdAt,
      this.preferVoice,
      this.currentPackage,
      this.isTrialPeriodEnd,
      this.subscriptionStartAt,
      this.subscriptionEndAt,
      this.canAccess});

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        avatarUrl: json["avatar_url"],
        name: json["name"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        gender: json["gender"],
        email: json["email"],
        language: json["language"],
        preferVoice: json["prefer_voice"],
        createdAt: json["created_at"],
        currentPackage: json["current_package"],
        isTrialPeriodEnd: json["is_trial_period_end"],
        canAccess: json["can_access"],
        subscriptionStartAt: json["subscription_start_at"] == null
            ? null
            : DateTime.parse(json["subscription_start_at"]),
        subscriptionEndAt: json["subscription_end_at"] == null
            ? null
            : DateTime.parse(json["subscription_end_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "avatar_url": avatarUrl,
        "name": name,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "email": email,
        "language": language,
        "prefer_voice": preferVoice,
        "created_at": createdAt,
        "current_package": currentPackage,
        "is_trial_period_end": isTrialPeriodEnd,
        "can_access": canAccess,
        "subscription_start_at":
            "${subscriptionStartAt!.year.toString().padLeft(4, '0')}-${subscriptionStartAt!.month.toString().padLeft(2, '0')}-${subscriptionStartAt!.day.toString().padLeft(2, '0')}",
        "subscription_end_at":
            "${subscriptionEndAt!.year.toString().padLeft(4, '0')}-${subscriptionEndAt!.month.toString().padLeft(2, '0')}-${subscriptionEndAt!.day.toString().padLeft(2, '0')}",
      };
}
