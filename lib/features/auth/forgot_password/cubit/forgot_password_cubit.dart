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
import 'package:medPilot/features/auth/forgot_password/view/set_password_screen.dart';
import '../../../../../core/constants/app_strings.dart';
import '../repository/forgot_password_repository_imp.dart';

part 'forgot_password_state.dart';

@injectable
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._forgotRepository) : super(const ForgotPasswordState());

  final ForgotPasswordRepositoryImp _forgotRepository;
  final _appPreferences = instance.get<AppPreferences>();

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final passwordNewCtrl = TextEditingController();
  final passwordConfirmCtrl = TextEditingController();

  Future<void> forgotPassword() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final formData = <String, dynamic>{};
      formData['email'] = emailCtrl.text;
      //formData['password'] = passwordCtrl.text;
      // formData['fcm_token'] = _appPreferences.getFcmToken();

      final response = await _forgotRepository.forgotPassword(formData);

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
          GetContext.to(SetPasswordScreen());
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
      emit(state.copyWith(appStatus: AppStatus.failure));
      log('$runtimeType:: @signIn => $e');
    }
  }

  Future<void> setPassword() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final formData = <String, dynamic>{};
      formData['email'] = emailCtrl.text;
      formData['password'] = passwordNewCtrl.text;
      // formData['fcm_token'] = _appPreferences.getFcmToken();

      final response = await _forgotRepository.setPassword(formData);

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
          GetContext.offAll(Routes.signIn);
          showCustomSnackBar(
            context: GetContext.context,
            message: AppStrings.successFullyChanged.tr(),
          );
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
    emailCtrl.clear();
    passwordCtrl.clear();
    passwordNewCtrl.clear();
    passwordConfirmCtrl.clear();

    emit(state.copyWith(appStatus: AppStatus.initial));
  }
}
