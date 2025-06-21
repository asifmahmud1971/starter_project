import 'package:medPilot/core/app/app_flavor.dart';

class ApiUrls {
  static String baseUrl = getServerUrl();
  static const String liveUrl =
      'https://my.medpilot.app/api/'; //live server
  static const String devUrl =
      'https://my.medpilot.app/api/'; // dev server
  static const String testUrl =
      'https://my.medpilot.app/api/'; // test server

  // get current flavor url
  static String getServerUrl() {
    if (AppFlavor.getFlavor == FlavorStatus.production) {
      return liveUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.development) {
      return devUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.staging) {
      return testUrl;
    } else {
      return liveUrl;
    }
  }
   //auth
  static const String login = 'login';
  static const String checkUser = 'check-user';
  static const String resetNewPassword = 'reset-new-password';
  static const String register = 'register';
  static const String checkEmailExists = 'check-email-exists';
  static const String registerSendOtp = 'register/send-otp';
  static const String registerVerifyOtp = 'register/verify-otp';
  static const String registerResendOtp = 'register/resend-otp';
  static const String profile = 'profile';
  static const String investigation = 'investigation';

  //dashboard

  static const String permission = 'permission';
  static const String prescription = 'prescription';
  static const String followUp = 'followup';
  static const String painAssessment = 'all-pain-assessment';
  static const String addPainAssessment = 'add-pain-assessment';
  static const String painMedication = 'pain-medication';
  static const String givenMedicine = 'given-medicine';
  static const String woundDescribeReport = 'wound-describe-report';
  static const String rehabPullCareReport = 'rehabilitative-pall-menu';
  static const String rehabilitativePallVideo = 'rehabilitative-pall-video';
  static const String uploadWoundImage = 'upload-wound-image';
  static const String showUploadDocument = 'show-upload-document';
  static const String showAllWoundAssessment = 'show-all-wound-assessment';
  static const String uploadDoc = 'show-upload-document';
  static const String homeVisit = 'home-visit';
  static const String procedure = 'procedure';
  static const String inPatientPackage = 'in-patient-package';
  static const String city = 'city';
  static const String thana = 'thana';
  static const String reportPsychoSocial = 'report-psycho-social';
  static const String addPsychoSocial = 'add-psycho-social';
  static const String uploadDocument = 'upload-document';



}
