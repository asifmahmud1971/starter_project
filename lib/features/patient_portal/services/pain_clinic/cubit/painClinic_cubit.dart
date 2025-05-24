import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/components/custom_snack_bar.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/home/repository/home_repository.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/medication_model.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/pain_assessment.dart';
import 'package:medPilot/features/patient_portal/services/repository/service_repository.dart';

part 'painClinic_state.dart';

@injectable
class PainClinicCubit extends Cubit<PainClinicState> {
  PainClinicCubit(this.serviceRepository) : super(const PainClinicState());

  final ServiceRepository serviceRepository;

  String? location;
  String? _test;
  String? changeOfTime;
  String? radiation;
  String? relievingFactors;
  String? severity;
  String? causeOfPain;



  Future<void> getPainAssessment() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final response = await serviceRepository.getPainAssessment({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, painAssessmentModel: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }
  Future<void> addPainAssessment() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final response = await serviceRepository.addPainAssessment({
        'date': DateTime.now().toString(),
        'pain_location': location,
        'change_of_time': changeOfTime,
        'radiation': radiation,
        'relieving_factors': relievingFactors,
        'severity': severity,
        'cause_of_pain': causeOfPain,
      });

      response.fold(
        (failure) {},
        (data) async {
          state.painAssessmentModel?.allPainAssessment?.add(data.savedData??AllPainAssessment());

          emit(state.copyWith(
              appStatus: AppStatus.success, painAssessmentModel:  state.painAssessmentModel));
        },
      );

      showCustomSnackBar(message: "Pain assessment submitted successfully");

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }


 Future<void> getPainMedication() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final response = await serviceRepository.getMedication({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, medicationModel: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }


}
