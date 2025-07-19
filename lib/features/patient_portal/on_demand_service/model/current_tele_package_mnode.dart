class CurrentTelePackageResponse {
  bool? success;
  String? currentTelePackage;
  List<String>? paymentOption;

  CurrentTelePackageResponse(
      {this.success, this.currentTelePackage, this.paymentOption});

  CurrentTelePackageResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    currentTelePackage = json['current_tele_package'];
    paymentOption = json['payment_option'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    data['current_tele_package'] = this.currentTelePackage;
    data['payment_option'] = this.paymentOption;
    return data;
  }
}