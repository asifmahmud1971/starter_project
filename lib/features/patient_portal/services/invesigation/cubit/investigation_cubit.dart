import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/app/app_dependency.dart';
import 'package:medPilot/core/app/app_preference.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/components/custom_snack_bar.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/services/invesigation/model/investigation_response.dart';
import '../../../../../core/constants/app_strings.dart';
import '../repository/investigation_repository_imp.dart';

part 'investigation_state.dart';

@injectable
class InvestigationCubit extends Cubit<InvestigationState> {
  InvestigationCubit(this._profileRepository) : super(const InvestigationState());

  final InvestigationRepositoryImp _profileRepository;
  final _appPreferences = instance.get<AppPreferences>();

  Future<void> getInvestigationData() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final formData = <String, dynamic>{};
      final response = await _profileRepository.getInvestigationData(formData);

      response.fold(
        (l) {
          showCustomSnackBar(
            context: GetContext.context,
            isError: true,
            message: AppStrings.somethingWentWrong.tr(),
          );

          emit(state.copyWith(appStatus: AppStatus.failure));
        },
        (r) async {
          emit(state.copyWith(appStatus: AppStatus.success,investigationsResponse: r));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
      emit(state.copyWith(appStatus: AppStatus.failure));
      log('$runtimeType:: @signIn => $e');
    }
  }

}
