part of 'services_cubit.dart';

class ServiceState extends Equatable {
  final AppStatus appStatus;
  final PrescriptionModel? prescriptionModel;


  const ServiceState( {
    this.prescriptionModel,
    this.appStatus = AppStatus.initial,
  });

  ServiceState copyWith({
    final AppStatus? appStatus,
    final PrescriptionModel? prescriptionModel,
    final FollowUpModel? followUp
  }) {
    return ServiceState(
      appStatus: appStatus ?? this.appStatus,
      prescriptionModel: prescriptionModel ?? this.prescriptionModel,
    );
  }

  @override
  List<Object> get props =>
      [appStatus, prescriptionModel ?? {}];
}
