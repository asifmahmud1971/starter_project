import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/components/custom_snack_bar.dart';
import 'package:medPilot/core/constants/app_print.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';
import 'package:medPilot/features/patient_portal/services/repository/service_repository.dart';

import '../../../../../core/app/app_context.dart';

part 'followup_state.dart';

@injectable
class FollowUpCubit extends Cubit<FollowUpState> {
  FollowUpCubit(this.serviceRepository) : super(const FollowUpState());

  final ServiceRepository serviceRepository;

  final TextEditingController bpHighController = TextEditingController();
  final TextEditingController bpLowController = TextEditingController();
  final TextEditingController pulseController = TextEditingController();
  final TextEditingController saturationController = TextEditingController();
  final TextEditingController oxygenController = TextEditingController();
  final TextEditingController tempController = TextEditingController();
  final TextEditingController intakeController = TextEditingController();
  final TextEditingController outputController = TextEditingController();
  final TextEditingController insulinController = TextEditingController();
  final TextEditingController bloodSugarController = TextEditingController();
  final TextEditingController painController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String? shortnessOfBreath;
  String? bowelMovement;
  String? functionalStatus;
  String? pain;
  final Map<String, bool> physicalSymptoms = {
    'Pain': false,
    'Nausea': false,
    'Breathlessness': false,
    'Constipation': false,
    'Restlessness': false,
    'Drowsiness': false,
    'Dyspepsia': false,
    'Cough': false,
    'Swelling': false,
    'Fever': false,
    'Urinary Problem': false,
    'Vomiting': false,
    'Lymphedema': false,
    'Bedsore': false,
    'Poor Appetite': false,
    'Sleep disturbance': false,
    'No Complain': false,
    'Others': false,
  };

  Future<void> getFollowUpReport() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));
    try {
      final response = await serviceRepository.getFollowUp({});
      response.fold(
            (failure) {
          dismissProgressDialog();
        },
            (data) async {
          emit(state.copyWith(
            appStatus: AppStatus.success,
            followUp: data,
            followupList: data.followup,));
        },
      );
      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> createFollowUp() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));
    final List<String> trueSymptoms = physicalSymptoms.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
    final data = <String, dynamic>{
      "bp_high": bpHighController.text,
      "bp_low": bpLowController.text,
      "pulse": pulseController.text,
      "saturation": saturationController.text,
      "temp": tempController.text,
      "intake": intakeController.text,
      "output": outputController.text,
      "insulin": insulinController.text,
      "sugar": bloodSugarController.text,
      "shortness_of_breath": shortnessOfBreathValue(shortnessOfBreath),
      "bowel_movement": bowelMovement == "Moved" ? "1" : "0",
      "reason": trueSymptoms ?? [],
      "functional_status": functionalStatus,
      "oxygen": oxygenController.text,
      "pain": painValue(pain)
    };
    try {
      final response = await serviceRepository.createFollowUp(data);
      response.fold(
            (failure) {},
            (data) async {
         /*     printLog(data.toString());
              List<Followup> updatedFollowList = [
                data,
                ...?state.followupList, // existing follow-ups
              ];*/
          emit(state.copyWith(appStatus: AppStatus.success, /*followupList: updatedFollowList*/));
          formFieldClean();
          GetContext.back();
          getFollowUpReport();
          showCustomSnackBar(
            context: GetContext.context,
            message: AppStrings.savedSuccessfullyCreated.tr(),
          );

        },
      );
      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  List<String> shortnessOfBreathList = ['N/A', 'Low', 'Medium', 'High'];

  String? shortnessOfBreathValue(String? shortOfBreath) {
    int index = shortnessOfBreathList.indexOf(shortOfBreath!);
    return index >= 0 ? "$index" : null;
  }

  List<String> painList = ['No Pain', 'Low', 'Medium', 'High'];

  String? painValue(String? shortOfBreath) {
    int index = painList.indexOf(shortOfBreath!);
    return index >= 0 ? "$index" : null;
  }

  List<String> functionalList = [
    'Stable',
    'Deteriorating'
  ];

  FormFieldValidator<String>? validator = (value) => (value??"").isEmpty ? 'This field is required' : null;

  void formFieldClean() {
    bpHighController.clear();
    bpLowController.clear();
    pulseController.clear();
    saturationController.clear();
    oxygenController.clear();
    tempController.clear();
    intakeController.clear();
    outputController.clear();
    insulinController.clear();
    bloodSugarController.clear();
    physicalSymptoms.updateAll((key, value) => false);
    shortnessOfBreath = null;
    bowelMovement = null;
    functionalStatus = null;
  }

}
