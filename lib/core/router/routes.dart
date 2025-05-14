import 'package:medPilot/features/auth/sign_in/view/sign_in_screen.dart';
import 'package:medPilot/features/auth/sign_up/view/sign_up_screen.dart';
import 'package:medPilot/features/dashboard/view/patient_dashboard_screen.dart';
import 'package:medPilot/features/dashboard/view/staff_dashboard_screen.dart';
import 'package:medPilot/features/patient_portal/cart/view/patient_cart_homescreen.dart';
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
          builder: (_) => const StaffDashboardScreen(),
          settings: routeSettings,
        );
      case Routes.patientDashboard:
        return CupertinoPageRoute(
          builder: (_) => const PatientDashboardScreen(),
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
