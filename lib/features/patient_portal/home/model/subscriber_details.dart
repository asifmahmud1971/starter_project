class SubscriberDetails {
  SubscriberDetails({
      this.subscribePackage,});

  SubscriberDetails.fromJson(dynamic json) {
    if (json['subscribe_package'] != null) {
      subscribePackage = [];
      json['subscribe_package'].forEach((v) {
        subscribePackage?.add(SubscribePackage.fromJson(v));
      });
    }
  }
  List<SubscribePackage>? subscribePackage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (subscribePackage != null) {
      map['subscribe_package'] = subscribePackage?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class SubscribePackage {
  SubscribePackage({
      this.homePackage,});

  SubscribePackage.fromJson(dynamic json) {
    homePackage = json['home_package'] != null ? HomePackage.fromJson(json['home_package']) : null;
  }
  HomePackage? homePackage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (homePackage != null) {
      map['home_package'] = homePackage?.toJson();
    }
    return map;
  }

}

class HomePackage {
  HomePackage({
      this.packageName, 
      this.fromTime, 
      this.endTime, 
      this.status,});

  HomePackage.fromJson(dynamic json) {
    packageName = json['package_name'];
    fromTime = json['from_time'];
    endTime = json['end_time'];
    status = json['status'];
  }
  String? packageName;
  String? fromTime;
  String? endTime;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['package_name'] = packageName;
    map['from_time'] = fromTime;
    map['end_time'] = endTime;
    map['status'] = status;
    return map;
  }

}