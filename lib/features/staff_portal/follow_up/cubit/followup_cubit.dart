import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/components/custom_snack_bar.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';
import 'package:medPilot/features/patient_portal/services/repository/service_repository.dart';
import 'package:medPilot/features/staff_portal/repository/staffPortal_repository.dart';

import '../../../../../core/app/app_context.dart';

part 'followup_state.dart';

@injectable
class StaffFollowUpCubit extends Cubit<StaffFollowUpState> {
  StaffFollowUpCubit(this.staffPortalRepository) : super(const StaffFollowUpState());

  final StaffPortalRepository staffPortalRepository;


  final formKey = GlobalKey<FormState>();


  Future<void> getFollowUpReport({patientId}) async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));
    try {
      final response = await staffPortalRepository.getPatientFollowUp({"patient_id": patientId});
      response.fold(
        (failure) {
          dismissProgressDialog();
        },
        (data) async {
          emit(state.copyWith(
            appStatus: AppStatus.success,
            followUp: data,
            followupList: data.followup,
          ));
        },
      );
      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }
  void clearFollowUp(){

    emit(state.copyWith(
      followUp: FollowUpModel(),
      followupList: [],
    ));
  }


}
