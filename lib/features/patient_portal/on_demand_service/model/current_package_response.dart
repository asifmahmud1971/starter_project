class CurrentPackageResponse {
  bool? success;
  String? currentPackage;
  String? agreementText;

  CurrentPackageResponse(
      {this.success, this.currentPackage, this.agreementText});

  CurrentPackageResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    currentPackage = json['current_package'];
    agreementText = json['agreement_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['current_package'] = currentPackage;
    data['agreement_text'] = agreementText;
    return data;
  }
}
