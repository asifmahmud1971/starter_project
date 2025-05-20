part of 'services_cubit.dart';

class ServiceState extends Equatable {
  final AppStatus appStatus;
  final PrescriptionModel? prescriptionModel;
  final FollowUpModel? followUp;

  const ServiceState( {
    this.prescriptionModel,
    this.appStatus = AppStatus.initial,
    this.followUp,
  });

  ServiceState copyWith({
    final AppStatus? appStatus,
    final PrescriptionModel? prescriptionModel,
    final FollowUpModel? followUp
  }) {
    return ServiceState(
      appStatus: appStatus ?? this.appStatus,
      prescriptionModel: prescriptionModel ?? this.prescriptionModel,
      followUp: followUp ?? this.followUp,
    );
  }

  @override
  List<Object> get props =>
      [appStatus, prescriptionModel ?? {},followUp??{}];
}
