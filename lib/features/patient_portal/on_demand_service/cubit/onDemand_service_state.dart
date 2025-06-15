part of 'onDemand_service_cubit.dart';

class OnDemandServiceState extends Equatable {
  final AppStatus appStatus;
  final HomeVisitModel? homeVisitModel;
  final ProcedureModel? procedureModel;


  const OnDemandServiceState(  {
    this.appStatus = AppStatus.initial,
    this.homeVisitModel,
    this.procedureModel,
  });

  OnDemandServiceState copyWith({
    final AppStatus? appStatus,
    final HomeVisitModel? homeVisitModel,
    final ProcedureModel? procedureModel,
    final FollowUpModel? followUp
  }) {
    return OnDemandServiceState(
      appStatus: appStatus ?? this.appStatus,
      homeVisitModel: homeVisitModel ?? this.homeVisitModel,
      procedureModel: procedureModel ?? this.procedureModel,
    );
  }

  @override
  List<Object> get props =>
      [appStatus, homeVisitModel ?? {},procedureModel??{}];
}
