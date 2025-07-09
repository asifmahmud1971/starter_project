part of 'attendance_cubit.dart';

class AttendanceState extends Equatable {
  final AppStatus appStatus;
  final RosterModel? rosterModel;
  final MedicineAlertModel? medicineAlertModel;
  final AttendanceModel? attendanceModel;

  const AttendanceState({
    this.appStatus = AppStatus.initial,
    this.rosterModel,
    this.medicineAlertModel,
    this.attendanceModel
  });

  AttendanceState copyWith(
      {final AppStatus? appStatus,
      final RosterModel? rosterModel,
      final MedicineAlertModel? medicineAlertModel,
        final AttendanceModel? attendanceModel
      }) {
    return AttendanceState(
        appStatus: appStatus ?? this.appStatus,
        rosterModel: rosterModel ?? this.rosterModel,
        medicineAlertModel: medicineAlertModel ?? this.medicineAlertModel,
        attendanceModel: attendanceModel ?? this.attendanceModel
    );
  }

  @override
  List<Object> get props =>
      [appStatus, rosterModel ?? {}, medicineAlertModel ?? {},attendanceModel ?? {}];
}
