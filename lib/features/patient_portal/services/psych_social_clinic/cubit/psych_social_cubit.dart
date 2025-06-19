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
import 'package:medPilot/features/patient_portal/services/psych_social_clinic/model/all_psych_social_response.dart';
import 'package:medPilot/features/patient_portal/services/psych_social_clinic/model/psycho_social_response.dart';
import '../../../../../core/constants/app_strings.dart';
import '../repository/psych_social_repository_imp.dart';

part 'psych_social_state.dart';

@injectable
class PsychSocialCubit extends Cubit<PsychSocialState> {
  PsychSocialCubit(this._psychSocialRepository) : super(const PsychSocialState());

  final PsychSocialRepositoryImp _psychSocialRepository;
  final _appPreferences = instance.get<AppPreferences>();

  String? anxiousValue;
  String? familyAnxiousValue;
  String? depressedValue;
  String? flatPeaceValue;
  String? shareFeelingsValue;
  String? informationValue;


  final List<String> optionsList = [
    'Not at All',
    'Slightly',
    'Moderately',
    'Severely',
  ];



  Future<void> getPsychoSocial() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final formData = <String, dynamic>{};
      final response = await _psychSocialRepository.getPsychoSocial(formData);

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
          emit(state.copyWith(appStatus: AppStatus.success,psychoSocialReportResponse: r));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
      emit(state.copyWith(appStatus: AppStatus.failure));
      log('$runtimeType:: @signIn => $e');
    }
  }



  Future<void> addPsychoSocial() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final formData = <String, dynamic>{
        "anxious_or_worried": anxiousValue??"",
        "family_anxious_or_worried": familyAnxiousValue??"",
        "feeling_depressed": depressedValue??"",
        "felt_at_peace": flatPeaceValue??"",
        "share_feeling": shareFeelingsValue??"",
        "much_information": informationValue??"",
      } ;
      final response = await _psychSocialRepository.addPsychoSocial(formData);

      response.fold(
        (l) {
          showCustomSnackBar(
            context: GetContext.context,
            isError: true,
            message: AppStrings.wrongCredential.tr(),
          );
          emit(state.copyWith(appStatus: AppStatus.failure));
        },
        (r) async {
          emit(state.copyWith(appStatus: AppStatus.success));
          GetContext.back();
          getPsychoSocial();
          showCustomSnackBar(
            context: GetContext.context,
            message: AppStrings.savedSuccessfully.tr(),
          );

        },
      );
      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
      emit(state.copyWith(appStatus: AppStatus.failure));
    }
  }

  void clearOptionData(){
    anxiousValue = null;
    familyAnxiousValue = null;
    depressedValue = null;
    flatPeaceValue = null;
    shareFeelingsValue = null;
    informationValue = null;
  }
}
