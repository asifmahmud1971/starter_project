import 'package:medPilot/generated/assets.dart';

class ServiceModel {
  String? icon;
  String? title;
  int? id;

  ServiceModel({this.icon, this.title, this.id});
}

List<ServiceModel> myPackageList = [
  ServiceModel(title: "Pescription", icon: Assets.medPrescription),
  ServiceModel(title: "Follow Up", icon: Assets.medFollowup),
  ServiceModel(title: "Investigation", icon: Assets.medInvestigationsup),
  ServiceModel(title: "Pain Clinic", icon: Assets.medPainClinic),
  ServiceModel(title: "Wound Clinic", icon: Assets.medWoundClinic),
  ServiceModel(title: "Psych-Social Clinic", icon: Assets.medPsychSocialClinic),
  ServiceModel(
      title: "Rehabilitative Pall Care",
      icon: Assets.medRehabilitativePallCare),
  ServiceModel(title: "Upload Document", icon: Assets.medUploadDocument),
];

List<ServiceModel> onDemandServiceList = [
  ServiceModel(title: "Home Visit", icon: Assets.medHomeVisit),
  ServiceModel(title: "Procedure", icon: Assets.medIconNurseVisit),
  ServiceModel(title: "Allied Health", icon: Assets.medAlliedHealth),
  ServiceModel(title: "Pharmacy", icon: Assets.medEPharmacy),
  ServiceModel(title: "Diagnostic Lab", icon: Assets.medDiagnosticLab),
  ServiceModel(title: "Instrument Rent", icon: Assets.medInstrumentRent),
  ServiceModel(title: "Ambullance", icon: Assets.medAmbulance),
  ServiceModel(title: "Consultant", icon: Assets.medConsultant),
  ServiceModel(title: "Tele Health", icon: Assets.medTelePackage),
  ServiceModel(title: "Home Care", icon: Assets.medHomePackage),
  ServiceModel(title: "Clinic", icon: Assets.medInPatientRequest),
  ServiceModel(title: "AssignStaff", icon: Assets.medAssignStaff),
  ServiceModel(title: "Lab Report", icon: Assets.medLabReport),
  ServiceModel(title: "Tracking Order", icon: Assets.medTreacking),
  ServiceModel(title: "Video Consultant", icon: Assets.medVideoConsultant),
];
