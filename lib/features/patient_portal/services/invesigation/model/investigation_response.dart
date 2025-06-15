class InvestigationsResponse {
  bool? success;
  PatientInfo? patientInfo;
  List<Investigations>? investigations;
  String? token;
  String? tokenType;

  InvestigationsResponse(
      {this.success,
        this.patientInfo,
        this.investigations,
        this.token,
        this.tokenType});

  InvestigationsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    patientInfo = json['patient_info'] != null
        ? new PatientInfo.fromJson(json['patient_info'])
        : null;
    if (json['investigations'] != null) {
      investigations = <Investigations>[];
      json['investigations'].forEach((v) {
        investigations!.add(new Investigations.fromJson(v));
      });
    }
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (patientInfo != null) {
      data['patient_info'] = patientInfo!.toJson();
    }
    if (investigations != null) {
      data['investigations'] =
          investigations!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
    data['token_type'] = tokenType;
    return data;
  }
}

class PatientInfo {
  int? id;
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

  PatientInfo(
      {this.id,
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
        this.updatedAt});

  PatientInfo.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['reg_no'] = regNo;
    data['user_id'] = userId;
    data['branch_id'] = branchId;
    data['name'] = name;
    data['dob'] = dob;
    data['age'] = age;
    data['thana'] = thana;
    data['city'] = city;
    data['gender'] = gender;
    data['address'] = address;
    data['mobile'] = mobile;
    data['email'] = email;
    data['consulting_doctor'] = consultingDoctor;
    data['doctor_contract_number'] = doctorContractNumber;
    data['alternative_number'] = alternativeNumber;
    data['password'] = password;
    data['status'] = status;
    data['land_mark'] = landMark;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Investigations {
  String? date;
  String? category;
  String? result;
  String? range;
  String? unit;
  String? type;

  Investigations(
      {this.date,
        this.category,
        this.result,
        this.range,
        this.unit,
        this.type});

  Investigations.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    category = json['category'];
    result = json['result'];
    range = json['range'];
    unit = json['unit'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['category'] = category;
    data['result'] = result;
    data['range'] = range;
    data['unit'] = unit;
    data['type'] = type;
    return data;
  }
}
