import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum DashboardStatus {
  initial,
  loading,
  success,
  failure,
}

class DashboardState extends Equatable {
  const DashboardState(
      {this.status = DashboardStatus.initial, this.selectedIndex = 0,this.selectedPage,});

  final DashboardStatus status;
  final int selectedIndex;
  final Widget? selectedPage;

  DashboardState copyWith(
      {final DashboardStatus? status, final int? selectedIndex,final Widget? selectedPage}) {
    return DashboardState(
      status: status ?? this.status,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedPage: selectedPage??this.selectedPage
    );
  }

  @override
  List<Object> get props => [status, selectedIndex,selectedPage??{}];
}
