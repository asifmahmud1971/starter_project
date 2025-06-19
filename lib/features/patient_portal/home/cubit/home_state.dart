part of 'home_cubit.dart';

class HomeState extends Equatable {
  final AppStatus appStatus;
  final DashboardPermission? dashboardPermission;
  final StaffPermissionModel? staffPermissionModel;
  final PrescriptionModel? prescriptionModel;

  const HomeState( {
    this.dashboardPermission,
    this.prescriptionModel,
    this.staffPermissionModel,
    this.appStatus = AppStatus.initial,
  });

  HomeState copyWith({
    final AppStatus? appStatus,
    final DashboardPermission? dashboardPermission,
    final StaffPermissionModel? staffPermissionModel,
    final PrescriptionModel? prescriptionModel,
  }) {
    return HomeState(
      appStatus: appStatus ?? this.appStatus,
      dashboardPermission: dashboardPermission ?? this.dashboardPermission,
      staffPermissionModel: staffPermissionModel ?? this.staffPermissionModel,
      prescriptionModel: prescriptionModel ?? this.prescriptionModel,
    );
  }

  @override
  List<Object> get props =>
      [appStatus, dashboardPermission ?? {}, prescriptionModel ?? {},staffPermissionModel??{}];
}
