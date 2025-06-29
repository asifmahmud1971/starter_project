class AssignShiftModel {
  bool? success;
  List<RosterInformation>? rosterInformation;

  AssignShiftModel({this.success, this.rosterInformation});

  AssignShiftModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['roster_information'] != null) {
      rosterInformation = <RosterInformation>[];
      json['roster_information'].forEach((v) {
        rosterInformation!.add(RosterInformation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (rosterInformation != null) {
      data['roster_information'] =
          rosterInformation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RosterInformation {
  String? date;
  String? shift;
  Staff? staff;

  RosterInformation({this.date, this.shift, this.staff});

  RosterInformation.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    shift = json['shift'];
    staff = json['staff'] != null ? Staff.fromJson(json['staff']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['shift'] = shift;
    if (staff != null) {
      data['staff'] = staff!.toJson();
    }
    return data;
  }
}

class Staff {
  int? id;
  String? companyId;
  String? userId;
  String? branchId;
  String? designation;
  String? role;
  String? username;
  String? password;
  String? name;
  String? lastName;
  String? fatherName;
  String? motherName;
  String? image;
  String? signature;
  String? dob;
  String? gander;
  String? presentAddress;
  String? permanentAddress;
  String? reference;
  String? parentsNid;
  String? nid;
  String? mobile;
  String? alternativeMobile;
  String? email;
  String? bmdcRegNo;
  String? bncRegNo;
  String? fortantText;
  String? staffType;
  String? monthlySalary;
  String? roster;
  String? food;
  String? night;
  String? oncallOnduty;
  String? oncallOffduty;
  String? conveyance;
  String? increment;
  String? bonus;
  String? providentFund;
  String? casualLeave;
  String? sickLeave;
  String? emergencyLeave;
  String? payLeave;
  String? educationalLeave;
  String? deduction;
  String? leaveCurrent;
  String? casualLeaveCurrent;
  String? sickLeaveCurrent;
  String? emergencyLeaveCurrent;
  String? payLeaveCurrent;
  String? educationalLeaveCurrent;
  String? status;
  String? rosterSalary;
  String? hourlySalary;
  String? weekend;
  String? globalLeave;
  String? description;
  String? createdAt;
  String? updatedAt;

  Staff(
      {this.id,
        this.companyId,
        this.userId,
        this.branchId,
        this.designation,
        this.role,
        this.username,
        this.password,
        this.name,
        this.lastName,
        this.fatherName,
        this.motherName,
        this.image,
        this.signature,
        this.dob,
        this.gander,
        this.presentAddress,
        this.permanentAddress,
        this.reference,
        this.parentsNid,
        this.nid,
        this.mobile,
        this.alternativeMobile,
        this.email,
        this.bmdcRegNo,
        this.bncRegNo,
        this.fortantText,
        this.staffType,
        this.monthlySalary,
        this.roster,
        this.food,
        this.night,
        this.oncallOnduty,
        this.oncallOffduty,
        this.conveyance,
        this.increment,
        this.bonus,
        this.providentFund,
        this.casualLeave,
        this.sickLeave,
        this.emergencyLeave,
        this.payLeave,
        this.educationalLeave,
        this.deduction,
        this.leaveCurrent,
        this.casualLeaveCurrent,
        this.sickLeaveCurrent,
        this.emergencyLeaveCurrent,
        this.payLeaveCurrent,
        this.educationalLeaveCurrent,
        this.status,
        this.rosterSalary,
        this.hourlySalary,
        this.weekend,
        this.globalLeave,
        this.description,
        this.createdAt,
        this.updatedAt});

  Staff.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    userId = json['user_id'];
    branchId = json['branch_id'];
    designation = json['designation'];
    role = json['role'];
    username = json['username'];
    password = json['password'];
    name = json['name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    image = json['image'];
    signature = json['signature'];
    dob = json['dob'];
    gander = json['gander'];
    presentAddress = json['present_address'];
    permanentAddress = json['permanent_address'];
    reference = json['reference'];
    parentsNid = json['parents_nid'];
    nid = json['nid'];
    mobile = json['mobile'];
    alternativeMobile = json['alternative_mobile'];
    email = json['email'];
    bmdcRegNo = json['bmdc_reg_no'];
    bncRegNo = json['bnc_reg_no'];
    fortantText = json['fortant_text'];
    staffType = json['staff_type'];
    monthlySalary = json['monthly_salary'];
    roster = json['roster'];
    food = json['food'];
    night = json['night'];
    oncallOnduty = json['oncall_onduty'];
    oncallOffduty = json['oncall_offduty'];
    conveyance = json['conveyance'];
    increment = json['increment'];
    bonus = json['bonus'];
    providentFund = json['provident_fund'];
    casualLeave = json['casual_leave'];
    sickLeave = json['sick_leave'];
    emergencyLeave = json['emergency_leave'];
    payLeave = json['pay_leave'];
    educationalLeave = json['educational_leave'];
    deduction = json['deduction'];
    leaveCurrent = json['leave_current'];
    casualLeaveCurrent = json['casual_leave_current'];
    sickLeaveCurrent = json['sick_leave_current'];
    emergencyLeaveCurrent = json['emergency_leave_current'];
    payLeaveCurrent = json['pay_leave_current'];
    educationalLeaveCurrent = json['educational_leave_current'];
    status = json['status'];
    rosterSalary = json['roster_salary'];
    hourlySalary = json['hourly_salary'];
    weekend = json['weekend'];
    globalLeave = json['global_leave'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['user_id'] = userId;
    data['branch_id'] = branchId;
    data['designation'] = designation;
    data['role'] = role;
    data['username'] = username;
    data['password'] = password;
    data['name'] = name;
    data['last_name'] = lastName;
    data['father_name'] = fatherName;
    data['mother_name'] = motherName;
    data['image'] = image;
    data['signature'] = signature;
    data['dob'] = dob;
    data['gander'] = gander;
    data['present_address'] = presentAddress;
    data['permanent_address'] = permanentAddress;
    data['reference'] = reference;
    data['parents_nid'] = parentsNid;
    data['nid'] = nid;
    data['mobile'] = mobile;
    data['alternative_mobile'] = alternativeMobile;
    data['email'] = email;
    data['bmdc_reg_no'] = bmdcRegNo;
    data['bnc_reg_no'] = bncRegNo;
    data['fortant_text'] = fortantText;
    data['staff_type'] = staffType;
    data['monthly_salary'] = monthlySalary;
    data['roster'] = roster;
    data['food'] = food;
    data['night'] = night;
    data['oncall_onduty'] = oncallOnduty;
    data['oncall_offduty'] = oncallOffduty;
    data['conveyance'] = conveyance;
    data['increment'] = increment;
    data['bonus'] = bonus;
    data['provident_fund'] = providentFund;
    data['casual_leave'] = casualLeave;
    data['sick_leave'] = sickLeave;
    data['emergency_leave'] = emergencyLeave;
    data['pay_leave'] = payLeave;
    data['educational_leave'] = educationalLeave;
    data['deduction'] = deduction;
    data['leave_current'] = leaveCurrent;
    data['casual_leave_current'] = casualLeaveCurrent;
    data['sick_leave_current'] = sickLeaveCurrent;
    data['emergency_leave_current'] = emergencyLeaveCurrent;
    data['pay_leave_current'] = payLeaveCurrent;
    data['educational_leave_current'] = educationalLeaveCurrent;
    data['status'] = status;
    data['roster_salary'] = rosterSalary;
    data['hourly_salary'] = hourlySalary;
    data['weekend'] = weekend;
    data['global_leave'] = globalLeave;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
