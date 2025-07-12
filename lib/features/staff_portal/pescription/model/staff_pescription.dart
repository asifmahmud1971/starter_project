class StaffPrescription {
  StaffPrescription({
      this.success, 
      this.token, 
      this.tokenType, 
      this.patient, 
      this.diagnosis, 
      this.prescriptions, 
      this.lastUpdate,});

  StaffPrescription.fromJson(dynamic json) {
    success = json['success'];
    token = json['token'];
    tokenType = json['token_type'];
    patient = json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    diagnosis = json['diagnosis'];
    prescriptions = json['prescriptions'] != null ? Prescriptions.fromJson(json['prescriptions']) : null;
    lastUpdate = json['last_update'];
  }
  bool? success;
  String? token;
  String? tokenType;
  Patient? patient;
  dynamic diagnosis;
  Prescriptions? prescriptions;
  String? lastUpdate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['token'] = token;
    map['token_type'] = tokenType;
    if (patient != null) {
      map['patient'] = patient?.toJson();
    }
    map['diagnosis'] = diagnosis;
    if (prescriptions != null) {
      map['prescriptions'] = prescriptions?.toJson();
    }
    map['last_update'] = lastUpdate;
    return map;
  }

}

class Prescriptions {
  Prescriptions({
      this.medicine, 
      this.advice,});

  Prescriptions.fromJson(dynamic json) {
    if (json['medicine'] != null) {
      medicine = [];
      json['medicine'].forEach((v) {
        medicine?.add(Medicine.fromJson(v));
      });
    }
    /*if (json['advice'] != null) {
      advice = [];
      json['advice'].forEach((v) {
        advice?.add(Dynamic.fromJson(v));
      });
    }*/
  }
  List<Medicine>? medicine;
  List<dynamic>? advice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (medicine != null) {
      map['medicine'] = medicine?.map((v) => v.toJson()).toList();
    }
    if (advice != null) {
      map['advice'] = advice?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Medicine {
  Medicine({
      this.id, 
      this.companyId, 
      this.patientId, 
      this.medicine, 
      this.note, 
      this.dose, 
      this.duration, 
      this.status, 
      this.generate, 
      this.createdAt, 
      this.updatedAt,});

  Medicine.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    patientId = json['patient_id'];
    medicine = json['medicine'];
    note = json['note'];
    dose = json['dose'];
    duration = json['duration'];
    status = json['status'];
    generate = json['generate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? companyId;
  String? patientId;
  String? medicine;
  String? note;
  String? dose;
  String? duration;
  String? status;
  String? generate;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['patient_id'] = patientId;
    map['medicine'] = medicine;
    map['note'] = note;
    map['dose'] = dose;
    map['duration'] = duration;
    map['status'] = status;
    map['generate'] = generate;
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