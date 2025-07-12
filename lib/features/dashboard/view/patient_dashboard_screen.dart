import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:medPilot/features/dashboard/cubit/dashboard_state.dart';
import 'package:medPilot/features/patient_portal/cart/view/patient_cart_homescreen.dart';
import 'package:medPilot/features/patient_portal/home/view/patient_home_screen.dart';
import 'package:medPilot/generated/assets.dart';

class PatientDashboardScreen extends StatefulWidget {
  const PatientDashboardScreen({super.key});

  @override
  State<PatientDashboardScreen> createState() => _PatientDashboardScreenState();
}

class _PatientDashboardScreenState extends State<PatientDashboardScreen> {

@override
  void initState() {
    // TODO: implement initState
  context.read<DashboardCubit>().onPageChanged(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          body: state.selectedPage,
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
            onTap: (v) {
              context.read<DashboardCubit>().onPageChanged(v);
            },
            currentIndex: state.selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: CustomSvg(
                  icon: Assets.medHome,
                ),
                activeIcon: CustomSvg(
                  icon: Assets.medHome,
                  color: AppColors.kPrimaryColor,
                ),
                label: "Home",

              ),
              BottomNavigationBarItem(
                icon: CustomSvg(
                  icon: Assets.medCart,
                ),
                activeIcon: CustomSvg(
                  icon: Assets.medCart,
                  color: AppColors.kPrimaryColor,
                ),
                label: "Queue",
              ),
              BottomNavigationBarItem(
                icon: CustomSvg(
                  icon: Assets.medMore,
                ),
                activeIcon: CustomSvg(
                  icon: Assets.medMore,
                  color: AppColors.kPrimaryColor,
                ),
                label: "More",
              ),
            ],
          ),
        );
      },
    );
  }
}
