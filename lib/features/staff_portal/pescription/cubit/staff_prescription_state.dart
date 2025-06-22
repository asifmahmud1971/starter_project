part of 'staff_prescription_cubit.dart';

class StaffPrescriptionState extends Equatable {
  final AppStatus appStatus;
  final StaffPrescription? staffPrescription;

  const StaffPrescriptionState({
    this.appStatus = AppStatus.initial,
    this.staffPrescription,
  });

  StaffPrescriptionState copyWith(
      {final AppStatus? appStatus,
        final StaffPrescription? staffPrescription}) {
    return StaffPrescriptionState(
        appStatus: appStatus ?? this.appStatus,
        staffPrescription: staffPrescription ?? this.staffPrescription);
  }

  @override
  List<Object> get props =>
      [appStatus, staffPrescription ?? {}];
}
