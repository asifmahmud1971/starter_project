part of 'medicine_alert_cubit.dart';

class MedicineAlertState extends Equatable {
  final AppStatus appStatus;
  final RosterModel? rosterModel;
  final MedicineAlertModel? medicineAlertModel;

  const MedicineAlertState({
    this.appStatus = AppStatus.initial,
    this.rosterModel,
    this.medicineAlertModel,
  });

  MedicineAlertState copyWith(
      {final AppStatus? appStatus,
      final RosterModel? rosterModel,
      final MedicineAlertModel? medicineAlertModel}) {
    return MedicineAlertState(
        appStatus: appStatus ?? this.appStatus,
        rosterModel: rosterModel ?? this.rosterModel,
        medicineAlertModel: medicineAlertModel ?? this.medicineAlertModel);
  }

  @override
  List<Object> get props =>
      [appStatus, rosterModel ?? {}, medicineAlertModel ?? {}];
}
