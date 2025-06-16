part of 'onDemand_service_cubit.dart';

class OnDemandServiceState extends Equatable {
  final AppStatus appStatus;
  final HomeVisitModel? homeVisitModel;
  final ProcedureModel? procedureModel;
  final CurrentPackageResponse? currentPackage;
  final CityResponse? city;
  final ThanaResponse? thana;

  const OnDemandServiceState({
    this.appStatus = AppStatus.initial,
    this.homeVisitModel,
    this.procedureModel,
    this.currentPackage,
    this.city,
    this.thana,
  });

  OnDemandServiceState copyWith(
      {final AppStatus? appStatus,
      final HomeVisitModel? homeVisitModel,
      final ProcedureModel? procedureModel,
      final FollowUpModel? followUp,
      final CurrentPackageResponse? currentPackage,
      final CityResponse? city,
      final ThanaResponse? thana}) {
    return OnDemandServiceState(
      appStatus: appStatus ?? this.appStatus,
      homeVisitModel: homeVisitModel ?? this.homeVisitModel,
      procedureModel: procedureModel ?? this.procedureModel,
      currentPackage: currentPackage ?? this.currentPackage,
      city: city ?? this.city,
      thana: thana ?? this.thana,
    );
  }

  @override
  List<Object> get props => [
        appStatus,
        homeVisitModel ?? {},
        procedureModel ?? {},
        currentPackage ?? {},
        city ?? {},
        thana ?? {},
      ];
}
