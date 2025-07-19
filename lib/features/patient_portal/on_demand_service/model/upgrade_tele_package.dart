class UpgradeTelePackage {
  bool? success;
  String? message;
  String? redirectUrl;

  UpgradeTelePackage({this.success, this.message, this.redirectUrl});

  UpgradeTelePackage.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    redirectUrl = json['redirect_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['redirect_url'] = redirectUrl;
    return data;
  }
}
