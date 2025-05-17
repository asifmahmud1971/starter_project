import 'package:medPilot/generated/assets.dart';

extension MedIconExtension on String {
  String? get medIcon {
    switch (this) {
      case "prescription":
        return Assets.medPrescription;
      case "follow_up":
        return Assets.medFollowup;
      case "investigation":
        return Assets.medInvestigationsup;
      case "pain_clinic":
        return Assets.medPainClinic;
      case "wound_clinic":
        return Assets.medWoundClinic;
      case "psych_social_clinic":
        return Assets.medPsychSocialClinic;
      case "rehabilitative_pall_care":
        return Assets.medRehabilitativePallCare;
      case "upload_document":
        return Assets.medUploadDocument;
      case "home_visit":
        return Assets.medHomeVisit;
      case "procedure":
        return Assets.medIconNurseVisit;
      case "allied_health":
        return Assets.medAlliedHealth;
      case "pharmacy":
        return Assets.medEPharmacy;
      case "diagnostic_lab":
        return Assets.medDiagnosticLab;
      case "instrument_rent":
        return Assets.medInstrumentRent;
      case "ambulance":
        return Assets.medAmbulance;
      case "consultant":
        return Assets.medConsultant;
      case "tele_package":
        return Assets.medTelePackage;
      case "home_package":
        return Assets.medHomePackage;
      case "in_patient_req":
        return Assets.medInPatientRequest;
      case "assign_staff":
        return Assets.medAssignStaff;
      case "lab_report":
        return Assets.medLabReport;
      case "pilot":
        return Assets.medPsychSocialClinic;
      case "clinic":
        return Assets.medInPatientRequest;

      default:
        return null;
    }
  }
}
