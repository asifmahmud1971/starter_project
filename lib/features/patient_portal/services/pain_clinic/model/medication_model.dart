class MedicationModel {
  MedicationModel({
      this.success, 
      this.patient, 
      this.painMedication, 
      this.token, 
      this.tokenType,});

  MedicationModel.fromJson(dynamic json) {
    success = json['success'];
    patient = json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    painMedication = json['pain_medication'] != null ? PainMedication.fromJson(json['pain_medication']) : null;
    token = json['token'];
    tokenType = json['token_type'];
  }
  bool? success;
  Patient? patient;
  PainMedication? painMedication;
  String? token;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (patient != null) {
      map['patient'] = patient?.toJson();
    }
    if (painMedication != null) {
      map['pain_medication'] = painMedication?.toJson();
    }
    map['token'] = token;
    map['token_type'] = tokenType;
    return map;
  }

}

class PainMedication {
  PainMedication({
      this.medicine, 
      this.chart,});

  PainMedication.fromJson(dynamic json) {
    medicine = json['medicine'] != null ? Medicine.fromJson(json['medicine']) : null;
    if (json['chart'] != null) {
      chart = [];
      json['chart'].forEach((v) {
        chart?.add(Chart.fromJson(v));
      });
    }
  }
  Medicine? medicine;
  List<Chart>? chart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (medicine != null) {
      map['medicine'] = medicine?.toJson();
    }
    if (chart != null) {
      map['chart'] = chart?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Chart {
  Chart({
      this.id, 
      this.companyId, 
      this.patientId, 
      this.date, 
      this.medicine, 
      this.time, 
      this.status, 
      this.givenTime, 
      this.createdAt, 
      this.updatedAt,});

  Chart.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    patientId = json['patient_id'];
    date = json['date'];
    medicine = json['medicine'];
    time = json['time'];
    status = json['status'];
    givenTime = json['given_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? companyId;
  String? patientId;
  String? date;
  String? medicine;
  String? time;
  String? status;
  String? givenTime;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['patient_id'] = patientId;
    map['date'] = date;
    map['medicine'] = medicine;
    map['time'] = time;
    map['status'] = status;
    map['given_time'] = givenTime;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class Medicine {
  Medicine({
      this.id, 
      this.companyId, 
      this.dose, 
      this.note, 
      this.duration, 
      this.patientId, 
      this.date, 
      this.medicine, 
      this.dose1, 
      this.dose2, 
      this.dose3, 
      this.dose4, 
      this.dose5, 
      this.dose6, 
      this.dose1Status, 
      this.dose2Status, 
      this.dose3Status, 
      this.dose4Status, 
      this.dose5Status, 
      this.dose6Status, 
      this.extraDose, 
      this.createdAt, 
      this.updatedAt,});

  Medicine.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    dose = json['dose'];
    note = json['note'];
    duration = json['duration'];
    patientId = json['patient_id'];
    date = json['date'];
    medicine = json['medicine'];
    dose1 = json['dose1'];
    dose2 = json['dose2'];
    dose3 = json['dose3'];
    dose4 = json['dose4'];
    dose5 = json['dose5'];
    dose6 = json['dose6'];
    dose1Status = json['dose1_status'];
    dose2Status = json['dose2_status'];
    dose3Status = json['dose3_status'];
    dose4Status = json['dose4_status'];
    dose5Status = json['dose5_status'];
    dose6Status = json['dose6_status'];
    extraDose = json['extra_dose'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? companyId;
  String? dose;
  String? note;
  String? duration;
  String? patientId;
  String? date;
  String? medicine;
  dynamic dose1;
  dynamic dose2;
  dynamic dose3;
  dynamic dose4;
  dynamic dose5;
  dynamic dose6;
  dynamic dose1Status;
  dynamic dose2Status;
  dynamic dose3Status;
  dynamic dose4Status;
  dynamic dose5Status;
  dynamic dose6Status;
  dynamic extraDose;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['dose'] = dose;
    map['note'] = note;
    map['duration'] = duration;
    map['patient_id'] = patientId;
    map['date'] = date;
    map['medicine'] = medicine;
    map['dose1'] = dose1;
    map['dose2'] = dose2;
    map['dose3'] = dose3;
    map['dose4'] = dose4;
    map['dose5'] = dose5;
    map['dose6'] = dose6;
    map['dose1_status'] = dose1Status;
    map['dose2_status'] = dose2Status;
    map['dose3_status'] = dose3Status;
    map['dose4_status'] = dose4Status;
    map['dose5_status'] = dose5Status;
    map['dose6_status'] = dose6Status;
    map['extra_dose'] = extraDose;
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
  dynamic thana;
  dynamic city;
  String? gender;
  dynamic address;
  String? mobile;
  String? email;
  String? consultingDoctor;
  String? doctorContractNumber;
  String? alternativeNumber;
  String? password;
  String? status;
  dynamic landMark;
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