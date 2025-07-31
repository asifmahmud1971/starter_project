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
      this.packageName, 
      this.fromTime, 
      this.endTime, 
      this.status, 
      this.type,});

  SubscribePackage.fromJson(dynamic json) {
    packageName = json['package_name'];
    fromTime = json['from_time'];
    endTime = json['end_time'];
    status = json['status'];
    type = json['type'];
  }
  String? packageName;
  String? fromTime;
  String? endTime;
  String? status;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['package_name'] = packageName;
    map['from_time'] = fromTime;
    map['end_time'] = endTime;
    map['status'] = status;
    map['type'] = type;
    return map;
  }

}