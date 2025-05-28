class WoundDescribeReportModel {
  WoundDescribeReportModel({
      this.success, 
      this.patient, 
      this.woundDescribe, 
      this.token, 
      this.tokenType,});

  WoundDescribeReportModel.fromJson(dynamic json) {
    success = json['success'];
    patient = json['patient'] != null ? Patient.fromJson(json['patient']) : null;
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
  Patient? patient;
  List<WoundDescribe>? woundDescribe;
  String? token;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (patient != null) {
      map['patient'] = patient?.toJson();
    }
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
      this.companyId, 
      this.patientId, 
      this.date, 
      this.location, 
      this.site, 
      this.occured, 
      this.patternOfWound, 
      this.createdAt, 
      this.updatedAt,});

  WoundDescribe.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    patientId = json['patient_id'];
    date = json['date'];
    location = json['location'];
    site = json['site'];
    occured = json['occured'];
    patternOfWound = json['pattern_of_wound'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? companyId;
  String? patientId;
  String? date;
  String? location;
  String? site;
  String? occured;
  String? patternOfWound;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['patient_id'] = patientId;
    map['date'] = date;
    map['location'] = location;
    map['site'] = site;
    map['occured'] = occured;
    map['pattern_of_wound'] = patternOfWound;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class Patient {
  Patient({
      this.id, 
      this.companyId, 
      this.regNo, 
      this.userId, 
      this.branchId, 
      this.name, 
      this.dob, 
      this.age, 
      this.thana, 
      this.city, 
      this.gender, 
      this.address, 
      this.mobile, 
      this.email, 
      this.consultingDoctor, 
      this.doctorContractNumber, 
      this.alternativeNumber, 
      this.password, 
      this.status, 
      this.landMark, 
      this.createdAt, 
      this.updatedAt,});

  Patient.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    regNo = json['reg_no'];
    userId = json['user_id'];
    branchId = json['branch_id'];
    name = json['name'];
    dob = json['dob'];
    age = json['age'];
    thana = json['thana'];
    city = json['city'];
    gender = json['gender'];
    address = json['address'];
    mobile = json['mobile'];
    email = json['email'];
    consultingDoctor = json['consulting_doctor'];
    doctorContractNumber = json['doctor_contract_number'];
    alternativeNumber = json['alternative_number'];
    password = json['password'];
    status = json['status'];
    landMark = json['land_mark'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? companyId;
  String? regNo;
  String? userId;
  String? branchId;
  String? name;
  String? dob;
  String? age;
  String? thana;
  String? city;
  String? gender;
  String? address;
  String? mobile;
  String? email;
  String? consultingDoctor;
  String? doctorContractNumber;
  String? alternativeNumber;
  String? password;
  String? status;
  String? landMark;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['reg_no'] = regNo;
    map['user_id'] = userId;
    map['branch_id'] = branchId;
    map['name'] = name;
    map['dob'] = dob;
    map['age'] = age;
    map['thana'] = thana;
    map['city'] = city;
    map['gender'] = gender;
    map['address'] = address;
    map['mobile'] = mobile;
    map['email'] = email;
    map['consulting_doctor'] = consultingDoctor;
    map['doctor_contract_number'] = doctorContractNumber;
    map['alternative_number'] = alternativeNumber;
    map['password'] = password;
    map['status'] = status;
    map['land_mark'] = landMark;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}