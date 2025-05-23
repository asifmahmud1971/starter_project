class UserProfileResponse {
  bool? success;
  ProfileDetails? profileDetails;

  UserProfileResponse({this.success, this.profileDetails});

  UserProfileResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    profileDetails = json['profile_details'] != null
        ? ProfileDetails.fromJson(json['profile_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (profileDetails != null) {
      data['profile_details'] = profileDetails!.toJson();
    }
    return data;
  }
}

class ProfileDetails {
  String? patientName;
  String? dob;
  String? gender;
  String? phone;
  String? doctorContactNo;
  int? cityId;
  int? thanaId;
  String? presentAddress;
  String? landMark;
  String? permanentAddress;
  String? bloodGroup;
  String? maritalStatus;
  String? nidPassport;
  String? familyContactPerson;
  String? relationFamilyContractPerson;
  String? contactPersonNumber;
  String? primaryDiagnosis;
  String? allergy;

  ProfileDetails(
      {this.patientName,
        this.dob,
        this.gender,
        this.phone,
        this.doctorContactNo,
        this.cityId,
        this.thanaId,
        this.presentAddress,
        this.landMark,
        this.permanentAddress,
        this.bloodGroup,
        this.maritalStatus,
        this.nidPassport,
        this.familyContactPerson,
        this.relationFamilyContractPerson,
        this.contactPersonNumber,
        this.primaryDiagnosis,
        this.allergy});

  ProfileDetails.fromJson(Map<String, dynamic> json) {
    patientName = json['patient_name'];
    dob = json['dob'];
    gender = json['gender'];
    phone = json['phone'];
    doctorContactNo = json['doctor_contact_no'];
    cityId = json['city_id'];
    thanaId = json['thana_id'];
    presentAddress = json['present_address'];
    landMark = json['land_mark'];
    permanentAddress = json['permanent_address'];
    bloodGroup = json['blood_group'];
    maritalStatus = json['marital_status'];
    nidPassport = json['nid_passport'];
    familyContactPerson = json['family_contact_person'];
    relationFamilyContractPerson = json['relation_family_contract_person'];
    contactPersonNumber = json['contact_person_number'];
    primaryDiagnosis = json['primary_diagnosis'];
    allergy = json['allergy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patient_name'] = patientName;
    data['dob'] = dob;
    data['gender'] = gender;
    data['phone'] = phone;
    data['doctor_contact_no'] = doctorContactNo;
    data['city_id'] = cityId;
    data['thana_id'] = thanaId;
    data['present_address'] = presentAddress;
    data['land_mark'] = landMark;
    data['permanent_address'] = permanentAddress;
    data['blood_group'] = bloodGroup;
    data['marital_status'] = maritalStatus;
    data['nid_passport'] = nidPassport;
    data['family_contact_person'] = familyContactPerson;
    data['relation_family_contract_person'] = relationFamilyContractPerson;
    data['contact_person_number'] = contactPersonNumber;
    data['primary_diagnosis'] = primaryDiagnosis;
    data['allergy'] = allergy;
    return data;
  }
}
