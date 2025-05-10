import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/app/app_context.dart';

import '../../patient_portal/home/view/patient_home_screen.dart';

part 'dashboard_state.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());
  int selectedIndex = 0;
  List<Widget> screen = [
    PatientHomeScreen()
    /*const HomeScreen(),
    const SessionsScreen(),
    const MyFavoritesScreen(),
    const MySessionsScreen(),*/
  ];

  void onItemTapped(int index) {
    selectedIndex = index;

      emit(state.copyWith(selectIndex: selectedIndex));

  }
}
