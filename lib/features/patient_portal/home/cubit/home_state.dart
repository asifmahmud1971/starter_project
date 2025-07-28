part of 'home_cubit.dart';

class HomeState extends Equatable {
  final AppStatus appStatus;
  final DashboardPermission? dashboardPermission;
  final StaffPermissionModel? staffPermissionModel;
  final PrescriptionModel? prescriptionModel;
  final BlogModel? blogModel;
  final SubscriberDetails? subscriberDetails;

  const HomeState({
    this.dashboardPermission,
    this.prescriptionModel,
    this.staffPermissionModel,
    this.blogModel,
    this.subscriberDetails,
    this.appStatus = AppStatus.initial,
  });

  HomeState copyWith(
      {final AppStatus? appStatus,
      final DashboardPermission? dashboardPermission,
      final StaffPermissionModel? staffPermissionModel,
      final BlogModel? blogModel,
      final PrescriptionModel? prescriptionModel,
      final SubscriberDetails? subscriberDetails}) {
    return HomeState(
      appStatus: appStatus ?? this.appStatus,
      dashboardPermission: dashboardPermission ?? this.dashboardPermission,
      staffPermissionModel: staffPermissionModel ?? this.staffPermissionModel,
      prescriptionModel: prescriptionModel ?? this.prescriptionModel,
      blogModel: blogModel ?? this.blogModel,
      subscriberDetails: subscriberDetails ?? this.subscriberDetails,
    );
  }

  @override
  List<Object> get props => [
        appStatus,
        dashboardPermission ?? {},
        prescriptionModel ?? {},
        staffPermissionModel ?? {},
        blogModel ?? {},
        subscriberDetails ?? {},
      ];
}
