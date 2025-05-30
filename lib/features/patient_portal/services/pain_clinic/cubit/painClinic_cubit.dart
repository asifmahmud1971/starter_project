import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/components/custom_snack_bar.dart';
import 'package:medPilot/core/constants/app_strings.dart';
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
          state.painAssessmentModel?.allPainAssessment?.insert(0,data.savedData??AllPainAssessment());

          emit(state.copyWith(
              appStatus: AppStatus.success, painAssessmentModel:  state.painAssessmentModel));
        },
      );
      GetContext.back();

      showCustomSnackBar(message: AppStrings.painAssessmentSubmittedSuccessfully.tr());

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

  Future<void> givenMedicine(String id, int medicationIndex) async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final response = await serviceRepository.givenMedicine({"chart_id": id});

      response.fold(
            (failure) {
          // Log the failure or show a message
          emit(state.copyWith(appStatus: AppStatus.failure));
          // Optionally: show user-friendly error
          showCustomSnackBar(isError: true,message: AppStrings.failedToUpdateMedication.tr());
        },
            (data) {
          final doseList = state.medicationModel?.painMedications?[medicationIndex].chart;

          if (doseList != null) {
            final doseIndex = doseList.indexWhere((e) => e.id == int.parse(id.toString()));

            if (doseIndex != -1) {
              doseList[doseIndex].taken = "Yes";
            } else {
              showCustomSnackBar(isError: true,message: AppStrings.doesNotFoundInChart.tr());
            }

            emit(state.copyWith(appStatus: AppStatus.success,medicationModel: state.medicationModel));
          } else {
            showCustomSnackBar(isError: true,message: AppStrings.noMedicationAvailable.tr());
            emit(state.copyWith(appStatus: AppStatus.failure));
          }
        },
      );
    } catch (e, stackTrace) {
      // Log the exception and stack trace
      print("Exception in givenMedicine: $e");
      print(stackTrace);
      showCustomSnackBar(isError: true,message: AppStrings.anUnExpectedErrorOccur.tr());
      emit(state.copyWith(appStatus: AppStatus.failure));
    } finally {
      dismissProgressDialog();
    }
  }




  void resetScreen(){
    location = null;
    changeOfTime = null;
    radiation = null;
    relievingFactors = null;
    severity = null;
    causeOfPain = null;
  }


}
