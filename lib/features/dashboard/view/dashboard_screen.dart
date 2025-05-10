import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:medPilot/features/patient_portal/home/view/patient_home_screen.dart';
import 'package:medPilot/generated/assets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  List<Widget> screen = [PatientHomeScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[0],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: AppColors.kWhiteColor,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle:
            kBodySmall.copyWith(color: AppColors.kGrayColor700),
        selectedLabelStyle: kBodySmall.copyWith(
            color: AppColors.kAudioButtonGrayColor,
            fontWeight: FontWeight.w700),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.kGrayColor900,
        useLegacyColorScheme: false,
        onTap: (v){},
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: CustomSvg(
              icon: Assets.iconsCurrency,
            ),
            activeIcon: CustomSvg(
              icon: Assets.iconsCurrency,
            ),
            label: "Test",
          ),
          BottomNavigationBarItem(
            icon: CustomSvg(
              icon: Assets.iconsCurrency,
            ),
            activeIcon: CustomSvg(
              icon: Assets.iconsCurrency,
            ),
            label: "Test",
          ),
          BottomNavigationBarItem(
            icon: CustomSvg(
              icon: Assets.iconsCurrency,
            ),
            activeIcon: CustomSvg(
              icon: Assets.iconsCurrency,
            ),
            label: "Test",
          ),
          BottomNavigationBarItem(
            icon: CustomSvg(
              icon: Assets.iconsCurrency,
            ),
            activeIcon: CustomSvg(
              icon: Assets.iconsCurrency,
            ),
            label: "Test",
          ),
        ],
      ),
    );
  }
}
