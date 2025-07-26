import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/model/medicine_alert_model.dart';
import 'package:medPilot/features/staff_portal/repository/staffPortal_repository.dart';
import 'package:medPilot/features/staff_portal/roaster/model/roster_model.dart';

part 'medicine_alert_state.dart';

@injectable
class MedicineAlertCubit extends Cubit<MedicineAlertState> {
  MedicineAlertCubit(this.staffPortalRepository)
      : super(const MedicineAlertState());

  final StaffPortalRepository staffPortalRepository;

  Future<void> getMedicineAlertData() async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading,
        medicineAlertModel: MedicineAlertModel()));
    try {
      final response = await staffPortalRepository.getMedicineAlertData({});

      response.fold(
        (failure) {},
        (data) async {
          data.alerts?.map((e) {
            log("Alert id: ${e.id}");
          });

          emit(state.copyWith(
              appStatus: AppStatus.success, medicineAlertModel: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> markAsMedicineGiven(id) async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));
    try {
      final response = await staffPortalRepository.markAsMedicineGiven(id);

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(appStatus: AppStatus.initial));
          final index = state.medicineAlertModel?.alerts
              ?.indexWhere((e) => e.id == data.data?.id);
          state.medicineAlertModel?.alerts?[index ?? 0].status = data.data;

          emit(state.copyWith(
              appStatus: AppStatus.success,
              medicineAlertModel: state.medicineAlertModel));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> markAsMedicineNotGiven(id) async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));
    try {
      final response = await staffPortalRepository.markAsMedicineNotGiven(id);

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(appStatus: AppStatus.initial));
          final index = state.medicineAlertModel?.alerts
              ?.indexWhere((e) => e.id == data.data?.id);
          state.medicineAlertModel?.alerts?[index ?? 0].status = data.data;
          emit(state.copyWith(
              appStatus: AppStatus.success,
              medicineAlertModel: state.medicineAlertModel));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }
}
