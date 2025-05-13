import 'dart:async';

import 'package:medPilot/core/app/app_dependency.dart';
import 'package:medPilot/core/app/app_preference.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/router/routes.dart';
import 'package:medPilot/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  final AppPreferences _appPreferences;

  SplashScreen({super.key}) : _appPreferences = instance.get();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _navigation);
  }

  void _navigation() async {
    if (widget._appPreferences.isUserLoggedIn()) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.dashboard, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.signIn, (route) => false);
    }
  }

  @override
  void initState() {
    _startDelay();

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPriceColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBackround),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Hero(
            tag: 'logo',
            child: Image.asset(
              Assets.imagesSplashLogo,
              width: 200.r,
              height: 72.r,
            ),
          ),
        ),
      ),
    );
  }
}
