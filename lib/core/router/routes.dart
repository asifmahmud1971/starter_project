import 'package:demo/features/screens/auth/sign_in/view/sign_in_screen.dart';
import 'package:demo/features/screens/auth/sign_up/view/sign_up_screen.dart';
import 'package:demo/features/screens/dashboard/view/dashboard_screen.dart';
import 'package:demo/features/screens/splash/view/splash_screen.dart';
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

  static const String dashboard = "/dashboard";
  static const String accountDetails = "/accountDetails";
  static const String cartScreen = "/cartScreen";
  static const String product = "/product";
  static const String allProducts = "/all-product";
  static const String imageGallery = "/image-gallery";
  static const String checkOut = "/check-out";
  static const String addressScreen = "/addressScreen";
  static const String addAddressScreen = "/addAddressScreen";
  static const String trackOrder = "/track_order";
  static const String confirmOrder = "/confirmOrder";
  static const String languageScreen = "/languageScreen";
  static const String sessionsScreen = "/sessions_screen";
  static const String createSessionScreen = "/create_session_screen";
  static const String sessionDetailsScreen = "/session_details_screen";
  static const String notificationScreen = "/notification_screen";
  static const String settingsScreen = "/settings_screen";
  static const String accountSettingScreen = "/account_setting_screen";
  static const String voiceSettingsScreen = "/voice_settings_screen";
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

      case Routes.dashboard:
        return CupertinoPageRoute(
          builder: (_) => const DashboardScreen(),
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
