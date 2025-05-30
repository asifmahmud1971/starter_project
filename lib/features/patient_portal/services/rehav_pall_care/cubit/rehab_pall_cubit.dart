import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/app/app_dependency.dart';
import 'package:medPilot/core/app/app_preference.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/components/custom_snack_bar.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/model/rehab_pall_care_response.dart';
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/repository/rehab_pall_repository_imp.dart';
import '../../../../../core/constants/app_strings.dart';
import '../model/rehab_pall_video_response.dart';
import '../repository/rehab_pall_repository.dart';
part 'rehab_pall_state.dart';

@injectable
class RehabPallCubit extends Cubit<RehabPallState> {
  RehabPallCubit(this._profileRepository) : super(const RehabPallState());

  final RehabPallRepositoryImp _profileRepository;
  final _appPreferences = instance.get<AppPreferences>();

  Future<void> faceRehabPallCareData() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final formData = <String, dynamic>{};
      final response = await _profileRepository.getRehabPall(formData);

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
          emit(state.copyWith(appStatus: AppStatus.success,rehabPallCareResponse: r));
        },
      );
      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
      emit(state.copyWith(appStatus: AppStatus.failure));
      log('$runtimeType:: @signIn => $e');
    }
  }

  Future<void> faceRehabPallVideoData() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final formData = <String, dynamic>{};
      final response = await _profileRepository.getRehabPallVideo(formData,1);

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
          emit(state.copyWith(appStatus: AppStatus.success,rehabPallVideoResponse: r));
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
