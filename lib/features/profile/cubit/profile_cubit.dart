import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/app/app_dependency.dart';
import 'package:medPilot/core/app/app_preference.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/components/custom_snack_bar.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/core/router/routes.dart';
import 'package:medPilot/features/profile/repository/profile_repository_imp.dart';
import '../../../../../core/constants/app_strings.dart';
import '../models/user_profile_response.dart';
part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepository) : super(const ProfileState());

  final ProfileRepositoryImp _profileRepository;
  final _appPreferences = instance.get<AppPreferences>();

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final maritalStatusController = TextEditingController();
  final mobileNoController = TextEditingController();
  final doctorContactController = TextEditingController();
  final addressController = TextEditingController();
  final contactPersonController = TextEditingController();
  final contactNumberController = TextEditingController();
  final allergiesController = TextEditingController();
  final primaryDiagnosisController = TextEditingController();
  final coMorbidityController = TextEditingController();

  Future<void> faceUserData() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final formData = <String, dynamic>{};
      final response = await _profileRepository.getUserData(formData);

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
          resetForm();
          emit(state.copyWith(appStatus: AppStatus.success,profileDetails: r.profileDetails));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
      emit(state.copyWith(appStatus: AppStatus.failure));
      log('$runtimeType:: @signIn => $e');
    }
  }


  Future<void> signIn() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final formData = <String, dynamic>{};
      formData['email'] = nameController.text;
      formData['password'] = ageController.text;
      // formData['fcm_token'] = _appPreferences.getFcmToken();

      final response = await _profileRepository.login(formData);

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
          resetForm();
          emit(state.copyWith(appStatus: AppStatus.success));
          await _appPreferences.saveUserData(r.user);
          await _appPreferences.setUserToken(r.token ?? "");
          await _appPreferences.setIsUserLoggedIn(true);
          if (r.user?.userType == "Patient") {
            GetContext.offAll(Routes.patientDashboard);
          } else {
            GetContext.offAll(Routes.staffDashboard);
          }
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
      emit(state.copyWith(appStatus: AppStatus.failure));
      log('$runtimeType:: @signIn => $e');
    }
  }

  void resetForm() {
    nameController.clear();
    ageController.clear();

    emit(state.copyWith(appStatus: AppStatus.initial));
  }
}
