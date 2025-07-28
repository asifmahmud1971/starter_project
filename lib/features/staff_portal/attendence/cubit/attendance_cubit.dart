import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/staff_portal/attendence/model/attendance_model.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/model/medicine_alert_model.dart';
import 'package:medPilot/features/staff_portal/repository/staffPortal_repository.dart';
import 'package:medPilot/features/staff_portal/roaster/model/roster_model.dart';

part 'attendance_state.dart';

@injectable
class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit(this.staffPortalRepository) : super(const AttendanceState());

  final StaffPortalRepository staffPortalRepository;

  Future<void> getAttendanceData() async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.initialLoading, attendanceModel: AttendanceModel()));
    try {
      final response = await staffPortalRepository.getAttendanceData({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, attendanceModel: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> checkIn(int id) async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading));
    try {
      final response = await staffPortalRepository.checkInMonthlyStaff(id);

      response.fold(
        (failure) {},
        (data) async {
          state.attendanceModel?.data?.checkIn?.canCheckIn = false;
          emit(state.copyWith(
              appStatus: AppStatus.success,attendanceModel: state.attendanceModel));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }
  Future<void> checkOut(int id) async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading));
    try {
      final response = await staffPortalRepository.checkOutMonthlyStaff(id);

      response.fold(
        (failure) {},
        (data) async {
          state.attendanceModel?.data?.checkOut?.canCheckOut = false;
          emit(state.copyWith(
              appStatus: AppStatus.success,attendanceModel: state.attendanceModel));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }
  Future<void> breakStart(int id) async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading));
    try {
      final response = await staffPortalRepository.breakStartMonthlyStaff(id);

      response.fold(
        (failure) {},
        (data) async {
          state.attendanceModel?.data?.breakStart?.canStartBreak = false;
          emit(state.copyWith(
              appStatus: AppStatus.success,attendanceModel: state.attendanceModel));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }
  Future<void> breakEnd(int id) async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading));
    try {
      final response = await staffPortalRepository.checkInMonthlyStaff(id);

      response.fold(
        (failure) {},
        (data) async {
          state.attendanceModel?.data?.breakEnd?.canEndBreak = false;
          emit(state.copyWith(
              appStatus: AppStatus.success,attendanceModel: state.attendanceModel));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }


}
