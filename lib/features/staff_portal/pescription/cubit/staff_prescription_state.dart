part of 'staff_prescription_cubit.dart';

class StaffPrescriptionState extends Equatable {
  final AppStatus appStatus;
  final StaffPrescription? staffPrescription;
  final PatientList? patientList;

  const StaffPrescriptionState({
    this.appStatus = AppStatus.initial,
    this.staffPrescription,
    this.patientList,
  });

  StaffPrescriptionState copyWith(
      {final AppStatus? appStatus,
      final StaffPrescription? staffPrescription,
      final PatientList? patientList}) {
    return StaffPrescriptionState(
      appStatus: appStatus ?? this.appStatus,
      staffPrescription: staffPrescription ?? this.staffPrescription,
      patientList: patientList ?? this.patientList,
    );
  }

  @override
  List<Object> get props =>
      [appStatus, staffPrescription ?? {}, patientList ?? {}];
}
