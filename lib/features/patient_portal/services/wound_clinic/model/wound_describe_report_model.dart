class WoundDescribeReportModel {
  WoundDescribeReportModel({
      this.success, 
      this.woundDescribe, 
      this.token, 
      this.tokenType,});

  WoundDescribeReportModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['wound_describe'] != null) {
      woundDescribe = [];
      json['wound_describe'].forEach((v) {
        woundDescribe?.add(WoundDescribe.fromJson(v));
      });
    }
    token = json['token'];
    tokenType = json['token_type'];
  }
  bool? success;
  List<WoundDescribe>? woundDescribe;
  String? token;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (woundDescribe != null) {
      map['wound_describe'] = woundDescribe?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    map['token_type'] = tokenType;
    return map;
  }

}

class WoundDescribe {
  WoundDescribe({
      this.id, 
      this.assId, 
      this.companyId, 
      this.patientId, 
      this.date, 
      this.location, 
      this.site, 
      this.occured, 
      this.patternOfWound, 
      this.createdAt, 
      this.updatedAt, 
      this.management,});

  WoundDescribe.fromJson(dynamic json) {
    id = json['id'];
    assId = json['ass_id'];
    companyId = json['company_id'];
    patientId = json['patient_id'];
    date = json['date'];
    location = json['location'];
    site = json['site'];
    occured = json['occured'];
    patternOfWound = json['pattern_of_wound'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['management'] != null) {
      management = [];
      json['management'].forEach((v) {
        management?.add(Management.fromJson(v));
      });
    }
  }
  num? id;
  String? assId;
  String? companyId;
  String? patientId;
  String? date;
  String? location;
  String? site;
  String? occured;
  String? patternOfWound;
  String? createdAt;
  String? updatedAt;
  List<Management>? management;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['ass_id'] = assId;
    map['company_id'] = companyId;
    map['patient_id'] = patientId;
    map['date'] = date;
    map['location'] = location;
    map['site'] = site;
    map['occured'] = occured;
    map['pattern_of_wound'] = patternOfWound;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (management != null) {
      map['management'] = management?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Management {
  Management({
      this.id, 
      this.companyId, 
      this.patientId, 
      this.date, 
      this.woundLocation, 
      this.debridement, 
      this.solution, 
      this.productUsed, 
      this.frequency, 
      this.nextDate, 
      this.createdAt, 
      this.updatedAt,});

  Management.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    patientId = json['patient_id'];
    date = json['date'];
    woundLocation = json['wound_location'];
    debridement = json['debridement'];
    solution = json['solution'];
    productUsed = json['product_used'];
    frequency = json['frequency'];
    nextDate = json['next_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? companyId;
  String? patientId;
  String? date;
  String? woundLocation;
  String? debridement;
  String? solution;
  String? productUsed;
  String? frequency;
  String? nextDate;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['patient_id'] = patientId;
    map['date'] = date;
    map['wound_location'] = woundLocation;
    map['debridement'] = debridement;
    map['solution'] = solution;
    map['product_used'] = productUsed;
    map['frequency'] = frequency;
    map['next_date'] = nextDate;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}