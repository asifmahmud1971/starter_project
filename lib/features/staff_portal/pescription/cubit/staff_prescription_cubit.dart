import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/procedure_model.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/model/medicine_alert_model.dart';
import 'package:medPilot/features/staff_portal/pescription/model/patient_list.dart';
import 'package:medPilot/features/staff_portal/pescription/model/staff_pescription.dart';
import 'package:medPilot/features/staff_portal/repository/staffPortal_repository.dart';
import 'package:medPilot/features/staff_portal/roaster/model/roster_model.dart';

part 'staff_prescription_state.dart';

@injectable
class StaffPrescriptionCubit extends Cubit<StaffPrescriptionState> {
  StaffPrescriptionCubit(this.staffPortalRepository) : super(const StaffPrescriptionState());

  final StaffPortalRepository staffPortalRepository;

  Future<void> getStaffPrescription({patientId}) async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading, staffPrescription: StaffPrescription()));
    try {
      final response = await staffPortalRepository.getStaffPrescription({"patient_id":patientId});

      response.fold(
            (failure) {},
            (data) async {
          emit(state.copyWith(appStatus: AppStatus.success, staffPrescription: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }
  Future<void> getPatientData() async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading, patientList: PatientList()));
    try {
      final response = await staffPortalRepository.getPatient({});

      response.fold(
            (failure) {},
            (data) async {
              log("patient count --------> ${data.patients?.length}");
          emit(state.copyWith(appStatus: AppStatus.success, patientList: data));


        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }



  void resetData(){
    emit(state.copyWith(
        appStatus: AppStatus.initial, staffPrescription: StaffPrescription()));
  }


}
