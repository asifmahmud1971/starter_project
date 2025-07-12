part of 'home_cubit.dart';

class HomeState extends Equatable {
  final AppStatus appStatus;
  final DashboardPermission? dashboardPermission;
  final StaffPermissionModel? staffPermissionModel;
  final PrescriptionModel? prescriptionModel;
  final BlogModel? blogModel;

  const HomeState( {
    this.dashboardPermission,
    this.prescriptionModel,
    this.staffPermissionModel,
    this.blogModel,
    this.appStatus = AppStatus.initial,
  });

  HomeState copyWith({
    final AppStatus? appStatus,
    final DashboardPermission? dashboardPermission,
    final StaffPermissionModel? staffPermissionModel,
    final BlogModel? blogModel,
    final PrescriptionModel? prescriptionModel,
  }) {
    return HomeState(
      appStatus: appStatus ?? this.appStatus,
      dashboardPermission: dashboardPermission ?? this.dashboardPermission,
      staffPermissionModel: staffPermissionModel ?? this.staffPermissionModel,
      prescriptionModel: prescriptionModel ?? this.prescriptionModel,
      blogModel: blogModel ?? this.blogModel,
    );
  }

  @override
  List<Object> get props =>
      [appStatus, dashboardPermission ?? {}, prescriptionModel ?? {},staffPermissionModel??{},blogModel??{}];
}
