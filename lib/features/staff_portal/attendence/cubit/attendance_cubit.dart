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
        appStatus: AppStatus.loading, attendanceModel: AttendanceModel()));
    try {
      final response = await staffPortalRepository.getAttendanceData({});

      response.fold(
            (failure) {},
            (data) async {
          emit(state.copyWith(appStatus: AppStatus.success, attendanceModel: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }


}
