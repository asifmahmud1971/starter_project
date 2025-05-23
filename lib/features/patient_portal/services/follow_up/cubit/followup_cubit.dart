import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/home/repository/home_repository.dart';
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


}
