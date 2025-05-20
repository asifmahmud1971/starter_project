class FollowUpModel {
  FollowUpModel({
      this.success, 
      this.patient, 
      this.followup, 
      this.token, 
      this.tokenType,});

  FollowUpModel.fromJson(dynamic json) {
    success = json['success'];
    patient = json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    if (json['followup'] != null) {
      followup = [];
      json['followup'].forEach((v) {
        followup?.add(Followup.fromJson(v));
      });
    }
    token = json['token'];
    tokenType = json['token_type'];
  }
  bool? success;
  Patient? patient;
  List<Followup>? followup;
  String? token;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (patient != null) {
      map['patient'] = patient?.toJson();
    }
    if (followup != null) {
      map['followup'] = followup?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    map['token_type'] = tokenType;
    return map;
  }

}

class Followup {
  Followup({
      this.id, 
      this.companyId, 
      this.patientId, 
      this.date, 
      this.time, 
      this.place, 
      this.type, 
      this.reason, 
      this.functionalStatus, 
      this.response, 
      this.bpHigh, 
      this.bpMin, 
      this.pulse, 
      this.saturation, 
      this.oxygen, 
      this.temp, 
      this.intake, 
      this.output, 
      this.otherReason, 
      this.otherResponse, 
      this.note, 
      this.insulin, 
      this.sugar, 
      this.pain, 
      this.shortnessOfBreath, 
      this.bowelMovement, 
      this.createdAt, 
      this.updatedAt,});

  Followup.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    patientId = json['patient_id'];
    date = json['date'];
    time = json['time'];
    place = json['place'];
    type = json['type'];
    reason = json['reason'];
    functionalStatus = json['functional_status'];
    response = json['response'];
    bpHigh = json['bp_high'];
    bpMin = json['bp_min'];
    pulse = json['pulse'];
    saturation = json['saturation'];
    oxygen = json['oxygen'];
    temp = json['temp'];
    intake = json['intake'];
    output = json['output'];
    otherReason = json['other_reason'];
    otherResponse = json['other_response'];
    note = json['note'];
    insulin = json['insulin'];
    sugar = json['sugar'];
    pain = json['pain'];
    shortnessOfBreath = json['shortness_of_breath'];
    bowelMovement = json['bowel_movement'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? companyId;
  String? patientId;
  String? date;
  String? time;
  String? place;
  String? type;
  String? reason;
  String? functionalStatus;
  String? response;
  dynamic bpHigh;
  dynamic bpMin;
  dynamic pulse;
  dynamic saturation;
  dynamic oxygen;
  dynamic temp;
  dynamic intake;
  dynamic output;
  String? otherReason;
  String? otherResponse;
  String? note;
  String? insulin;
  String? sugar;
  String? pain;
  String? shortnessOfBreath;
  String? bowelMovement;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['patient_id'] = patientId;
    map['date'] = date;
    map['time'] = time;
    map['place'] = place;
    map['type'] = type;
    map['reason'] = reason;
    map['functional_status'] = functionalStatus;
    map['response'] = response;
    map['bp_high'] = bpHigh;
    map['bp_min'] = bpMin;
    map['pulse'] = pulse;
    map['saturation'] = saturation;
    map['oxygen'] = oxygen;
    map['temp'] = temp;
    map['intake'] = intake;
    map['output'] = output;
    map['other_reason'] = otherReason;
    map['other_response'] = otherResponse;
    map['note'] = note;
    map['insulin'] = insulin;
    map['sugar'] = sugar;
    map['pain'] = pain;
    map['shortness_of_breath'] = shortnessOfBreath;
    map['bowel_movement'] = bowelMovement;
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