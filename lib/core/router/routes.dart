import 'package:medPilot/features/auth/sign_in/view/sign_in_screen.dart';
import 'package:medPilot/features/auth/sign_up/view/sign_up_screen.dart';
import 'package:medPilot/features/dashboard/view/patient_dashboard_screen.dart';
import 'package:medPilot/features/dashboard/view/staff_dashboard_screen.dart';
import 'package:medPilot/features/patient_portal/cart/view/patient_cart_homescreen.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/view/allied_health_page.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/view/consultation_screen.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/view/diagonostic_lab_page.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/view/home_visit_page.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/view/pharmacy_page.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/view/procedure_page.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/view/followUp_list_page.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/view/followUp_description_page.dart';
import 'package:medPilot/features/patient_portal/services/invesigation/view/investigation_screen.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/view/pain_clinic_screen.dart';
import 'package:medPilot/features/patient_portal/services/psych_social_clinic/view/psych_social_report_screen.dart';
import 'package:medPilot/features/patient_portal/services/upload_document/view/all_upload_page.dart';
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/view/rehab_pall_care_screen.dart';
import 'package:medPilot/features/patient_portal/services/view/pescription_page.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/view/wound_clinic_home.dart';
import 'package:medPilot/features/splash/view/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';

class Routes {
  // global routes
  static const String splash = "/";
  static const String signIn = "/sign-in";
  static const String termsAndConditions = "/terms-and-conditions";
  static const String signUp = "/sign-up";

  // static const String setPassword = "/set-password";

  static const String staffDashboard = "/staffDashboard";
  static const String patientDashboard = "/patientDashboard";
  static const String prescription = "prescription";
  static const String followUp = "follow_up";
  static const String investigation = "investigation";
  static const String painClinic = "pain_clinic";
  static const String woundClinic = "wound_clinic";
  static const String psychSocialReport = "psych_social_clinic";
  static const String rehabilitativePallCare = "rehabilitative_pall_care";
  static const String allUploads = "upload_document";
  static const String homeVisit = "home_visit";
  static const String procedure = "procedure";
  static const String alliedHealth = "allied_health";
  static const String diagnosticLab = "diagnostic_lab";
  static const String pharmacy = "pharmacy";
  static const String consultation = "consultant";

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // global routes start
      case Routes.splash:
        return CupertinoPageRoute(
          builder: (_) => SplashScreen(),
          settings: routeSettings,
        );

      case Routes.signIn:
        return CupertinoPageRoute(
          builder: (_) => const SignInScreen(),
          settings: routeSettings,
        );

      case Routes.signUp:
        return CupertinoPageRoute(
          builder: (_) => const SignUpScreen(),
          settings: routeSettings,
        );

      // case Routes.setPassword:
      //   return CupertinoPageRoute(
      //     builder: (_) => const SetPasswordScreen(),
      //     settings: routeSettings,
      //   );

      case Routes.staffDashboard:
        return CupertinoPageRoute(
          builder: (_) =>  StaffDashboardScreen(),
          settings: routeSettings,
        );
      case Routes.patientDashboard:
        return CupertinoPageRoute(
          builder: (_) => const PatientDashboardScreen(),
          settings: routeSettings,
        );
        case Routes.prescription:
        return CupertinoPageRoute(
          builder: (_) =>  PrescriptionScreen(),
          settings: routeSettings,
        );
      // global routes end
 case Routes.followUp:
        return CupertinoPageRoute(
          builder: (_) =>  FollowupListPage(),
          settings: routeSettings,
        );

        case Routes.investigation:
        return CupertinoPageRoute(
          builder: (_) =>  InvestigationReportScreen(),
          settings: routeSettings,
        );
      // global routes end
case Routes.painClinic:
        return CupertinoPageRoute(
          builder: (_) =>  PainClinicScreen(),
          settings: routeSettings,
        );
  case Routes.woundClinic:
        return CupertinoPageRoute(
          builder: (_) =>  WoundClinicHome(),
          settings: routeSettings,
        );
  case Routes.psychSocialReport:
        return CupertinoPageRoute(
          builder: (_) =>  PsychoSocialReportPage(),
          settings: routeSettings,
        );
  case Routes.rehabilitativePallCare:
        return CupertinoPageRoute(
          builder: (_) =>  RehabPallCareScreen(),
          settings: routeSettings,
        );
      // global routes end
case Routes.allUploads:
        return CupertinoPageRoute(
          builder: (_) =>  AllUploadPage(),
          settings: routeSettings,
        );
      // global routes end
    case Routes.homeVisit:
        return CupertinoPageRoute(
          builder: (_) =>  HomeVisitPage(),
          settings: routeSettings,
        );
      // global routes end
 case Routes.procedure:
        return CupertinoPageRoute(
          builder: (_) =>  ProcedurePage(),
          settings: routeSettings,
        );
      // global routes end
case Routes.alliedHealth:
        return CupertinoPageRoute(
          builder: (_) =>  AlliedHealthPage(),
          settings: routeSettings,
        );
      // global routes end
case Routes.diagnosticLab:
        return CupertinoPageRoute(
          builder: (_) =>  DiagnosticLabPage(),
          settings: routeSettings,
        );
      // global routes end
case Routes.pharmacy:
        return CupertinoPageRoute(
          builder: (_) =>  PharmacyPage(),
          settings: routeSettings,
        );
      // global routes end
case Routes.consultation:
        return CupertinoPageRoute(
          builder: (_) =>  ConsultationScreen(),
          settings: routeSettings,
        );
      // global routes end



      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return CupertinoPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.noPageFound.tr()),
        ),
        body: Center(
          child: Text(AppStrings.noPageFound.tr()),
        ),
      ),
    );
  }
}
