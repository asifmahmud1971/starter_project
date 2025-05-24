import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/constants/app_print.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';
import 'package:medPilot/features/patient_portal/services/repository/service_repository.dart';
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
  final Map<String, bool> physicalSymptoms = {
    'Pain': false,
    'Nausea': false,
    'Breathlessness': false,
    'Constipation': false,
    'Restlessness': false,
    'Drowsiness': true,
    'Dyspepsia': false,
    'Cough': false,
    'Swelling': true,
    'Fever': false,
    'Urinary Problem': false,
    'Vomiting': false,
    'Lymphedema': false,
    'Bedstore': false,
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
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, followUp: data));
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
      "shortness_of_breath": shortnessOfBreath,
      "bowel_movement": bowelMovement,
      "reason": trueSymptoms??[],
      "functional_status": functionalStatus,
      "oxygen": oxygenController.text,
      "pain": painController.text
    };
    try {
      final response = await serviceRepository.createFollowUp(data);
      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, followUp: data));
        },
      );
      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }


  void dispose() {
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
  }

}
