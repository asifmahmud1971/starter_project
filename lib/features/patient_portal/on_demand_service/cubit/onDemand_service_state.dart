part of 'onDemand_service_cubit.dart';

class OnDemandServiceState extends Equatable {
  final AppStatus appStatus;
  final OnServiceModel? onService;
  final FollowUpModel? followUp;
  final CurrentPackageResponse? currentPackage;
  final CityResponse? city;
  final ThanaResponse? thana;
  final ConsultantsResponse? consultantsResponse;
  final AssignShiftModel? assignStaffModel;

  const OnDemandServiceState({this.appStatus = AppStatus.initial,
    this.onService,
    this.followUp,
    this.currentPackage,
    this.city,
    this.thana,
    this.consultantsResponse,
    this.assignStaffModel
  });

  OnDemandServiceState copyWith({
    final AppStatus? appStatus,
    final OnServiceModel? onService,
    final FollowUpModel? followUp,
    final CurrentPackageResponse? currentPackage,
    final CityResponse? city,
    final ThanaResponse? thana,
    final ConsultantsResponse? consultantsResponse,
    final AssignShiftModel? assignStaffModel
  }) {
    return OnDemandServiceState(
      appStatus: appStatus ?? this.appStatus,
      onService: onService ?? this.onService,
      followUp: followUp ?? this.followUp,
      currentPackage: currentPackage ?? this.currentPackage,
      city: city ?? this.city,
      thana: thana ?? this.thana,
      consultantsResponse: consultantsResponse ?? this.consultantsResponse,
      assignStaffModel: assignStaffModel ?? this.assignStaffModel,
    );
  }

  @override
  List<Object> get props =>
      [
        appStatus,
        onService ?? {},
        followUp ?? {},
        currentPackage ?? {},
        city ?? {},
        thana ?? {},
        consultantsResponse ?? {},
        assignStaffModel ?? {}
      ];
}
