import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';

class StaffPermissionModel {
  StaffPermissionModel({
      this.success, 
      this.userType,
      this.staffPermission,});

  StaffPermissionModel.fromJson(dynamic json) {
    success = json['success'];
    userType = json['user_type'];
    if (json['staffPermission'] != null) {
      staffPermission = [];
      json['staffPermission'].forEach((v) {
        staffPermission?.add(Package.fromJson(v));
      });
    }
  }
  bool? success;
  String? userType;
  List<Package>? staffPermission;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['user_type'] = userType;
    if (staffPermission != null) {
      map['staffPermission'] = staffPermission?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

