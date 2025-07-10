import 'package:medPilot/features/patient_portal/home/helper/dashboard_icon.dart';

class DashboardPermission {
  DashboardPermission({
    this.success,
    this.userType,
    this.myPackage,
    this.onDemand,
    this.staffPermission,
  });

  DashboardPermission.fromJson(dynamic json) {
    success = json['success'];
    userType = json['user_type'];
    if (json['myPackage'] != null) {
      myPackage = [];
      json['myPackage'].forEach((v) {
        myPackage?.add(Package.fromJson(v));
      });
    }
    if (json['onDemand'] != null) {
      onDemand = [];
      json['onDemand'].forEach((v) {
        onDemand?.add(Package.fromJson(v));
      });
    }
    staffPermission = json['staffPermission'] != null
        ? StaffPermission.fromJson(json['staffPermission'])
        : null;
  }

  bool? success;
  String? userType;
  List<Package>? myPackage;
  List<Package>? onDemand;
  StaffPermission? staffPermission;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['user_type'] = userType;
    if (myPackage != null) {
      map['myPackage'] = myPackage?.map((v) => v.toJson()).toList();
    }
    if (onDemand != null) {
      map['onDemand'] = onDemand?.map((v) => v.toJson()).toList();
    }
    if (staffPermission != null) {
      map['staffPermission'] = staffPermission?.toJson();
    }
    return map;
  }
}

class StaffPermission {
  StaffPermission({
    this.sp101,
    this.sp102,
    this.sp103,
    this.sp104,
    this.sp105,
    this.sp106,
    this.sp107,
  });

  StaffPermission.fromJson(dynamic json) {
    sp101 = json['SP101'] != null ? Sp101.fromJson(json['SP101']) : null;
    sp102 = json['SP102'] != null ? Sp102.fromJson(json['SP102']) : null;
    sp103 = json['SP103'] != null ? Sp103.fromJson(json['SP103']) : null;
    sp104 = json['SP104'] != null ? Sp104.fromJson(json['SP104']) : null;
    sp105 = json['SP105'] != null ? Sp105.fromJson(json['SP105']) : null;
    sp106 = json['SP106'] != null ? Sp106.fromJson(json['SP106']) : null;
    sp107 = json['SP107'] != null ? Sp107.fromJson(json['SP107']) : null;
  }

  Sp101? sp101;
  Sp102? sp102;
  Sp103? sp103;
  Sp104? sp104;
  Sp105? sp105;
  Sp106? sp106;
  Sp107? sp107;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (sp101 != null) {
      map['SP101'] = sp101?.toJson();
    }
    if (sp102 != null) {
      map['SP102'] = sp102?.toJson();
    }
    if (sp103 != null) {
      map['SP103'] = sp103?.toJson();
    }
    if (sp104 != null) {
      map['SP104'] = sp104?.toJson();
    }
    if (sp105 != null) {
      map['SP105'] = sp105?.toJson();
    }
    if (sp106 != null) {
      map['SP106'] = sp106?.toJson();
    }
    if (sp107 != null) {
      map['SP107'] = sp107?.toJson();
    }
    return map;
  }
}

class Sp107 {
  Sp107({
    this.serviceName,
    this.icon,
    this.key,
    this.isActive,
  });

  Sp107.fromJson(dynamic json) {
    serviceName = json['serviceName'];
    icon = json['icon'];
    key = json['key'];
    isActive = json['isActive'];
  }

  String? serviceName;
  String? icon;
  String? key;
  bool? isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceName'] = serviceName;
    map['icon'] = icon;
    map['key'] = key;
    map['isActive'] = isActive;
    return map;
  }
}

class Sp106 {
  Sp106({
    this.serviceName,
    this.icon,
    this.key,
    this.isActive,
  });

  Sp106.fromJson(dynamic json) {
    serviceName = json['serviceName'];
    icon = json['icon'];
    key = json['key'];
    isActive = json['isActive'];
  }

  String? serviceName;
  String? icon;
  String? key;
  bool? isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceName'] = serviceName;
    map['icon'] = icon;
    map['key'] = key;
    map['isActive'] = isActive;
    return map;
  }
}

class Sp105 {
  Sp105({
    this.serviceName,
    this.icon,
    this.key,
    this.isActive,
  });

  Sp105.fromJson(dynamic json) {
    serviceName = json['serviceName'];
    icon = json['icon'];
    key = json['key'];
    isActive = json['isActive'];
  }

  String? serviceName;
  String? icon;
  String? key;
  bool? isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceName'] = serviceName;
    map['icon'] = icon;
    map['key'] = key;
    map['isActive'] = isActive;
    return map;
  }
}

class Sp104 {
  Sp104({
    this.serviceName,
    this.icon,
    this.key,
    this.isActive,
  });

  Sp104.fromJson(dynamic json) {
    serviceName = json['serviceName'];
    icon = json['icon'];
    key = json['key'];
    isActive = json['isActive'];
  }

  String? serviceName;
  String? icon;
  String? key;
  bool? isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceName'] = serviceName;
    map['icon'] = icon;
    map['key'] = key;
    map['isActive'] = isActive;
    return map;
  }
}

class Sp103 {
  Sp103({
    this.serviceName,
    this.icon,
    this.key,
    this.isActive,
  });

  Sp103.fromJson(dynamic json) {
    serviceName = json['serviceName'];
    icon = json['icon'];
    key = json['key'];
    isActive = json['isActive'];
  }

  String? serviceName;
  String? icon;
  String? key;
  bool? isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceName'] = serviceName;
    map['icon'] = icon;
    map['key'] = key;
    map['isActive'] = isActive;
    return map;
  }
}

class Sp102 {
  Sp102({
    this.serviceName,
    this.icon,
    this.key,
    this.isActive,
  });

  Sp102.fromJson(dynamic json) {
    serviceName = json['serviceName'];
    icon = json['icon'];
    key = json['key'];
    isActive = json['isActive'];
  }

  String? serviceName;
  String? icon;
  String? key;
  bool? isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceName'] = serviceName;
    map['icon'] = icon;
    map['key'] = key;
    map['isActive'] = isActive;
    return map;
  }
}

class Sp101 {
  Sp101({
    this.serviceName,
    this.icon,
    this.key,
    this.isActive,
  });

  Sp101.fromJson(dynamic json) {
    serviceName = json['serviceName'];
    icon = json['icon'];
    key = json['key'];
    isActive = json['isActive'];
  }

  String? serviceName;
  String? icon;
  String? key;
  bool? isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceName'] = serviceName;
    map['icon'] = icon;
    map['key'] = key;
    map['isActive'] = isActive;
    return map;
  }
}



class Package {
  Package({
    this.serviceName,
    this.icon,
    this.key,
    this.staticIcon,
    this.isActive,
  });

  Package.fromJson(dynamic json) {
    serviceName = json['serviceName'];
    key = json['key'];
    icon = json['icon'];
    staticIcon= key?.medIcon??"";
    isActive = json['isActive'];
  }

  String? serviceName;
  String? icon;
  String? key;
  String? staticIcon;
  bool? isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceName'] = serviceName;
    map['icon'] = icon;
    map['key'] = key;
    map['isActive'] = isActive;
    return map;
  }
}
