import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/app/app_dependency.dart';

import 'package:medPilot/core/app/app_preference.dart';
import 'package:medPilot/features/dashboard/cubit/dashboard_state.dart';
import 'package:medPilot/features/patient_portal/cart/view/patient_cart_homescreen.dart';
import 'package:medPilot/features/patient_portal/home/view/patient_home_screen.dart';
import 'package:medPilot/features/patient_portal/more/view/more_option_screen.dart';
import 'package:medPilot/features/staff_portal/view/staff_home_screen.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';


@injectable
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit()
      : appPreferences = instance.get(),
        super(const DashboardState());

  final AppPreferences appPreferences;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget>? screen = [
    const PatientHomeScreen(),
    const PatientCartPage(),
    MoreOptionScreen()
  ];
   List<Widget>? staffScreen = [
    const StaffHomeScreen(),
    const PatientCartPage(),
    MoreOptionScreen()
  ];

  void onPageChanged(int index) async {
    if(appPreferences.getUserData().userType == "Patient"){
      emit(state.copyWith(selectedIndex: index,selectedPage: screen?[index]?? PatientHomeScreen()));
    }else{
      emit(state.copyWith(selectedIndex: index,selectedPage: staffScreen?[index]?? StaffHomeScreen()));
    }



  }
}
