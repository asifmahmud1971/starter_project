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
import '../../../../../core/constants/app_strings.dart';
import '../repository/sign_in_repository_imp.dart';

part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signRepository) : super(const SignInState());

  final SignInRepositoryImp _signRepository;
  final _appPreferences = instance.get<AppPreferences>();

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  Future<void> signIn() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final formData = <String, dynamic>{};
      formData['email'] = emailCtrl.text;
      formData['password'] = passwordCtrl.text;
      // formData['fcm_token'] = _appPreferences.getFcmToken();

      final response = await _signRepository.login(formData);

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
    emailCtrl.clear();
    passwordCtrl.clear();

    emit(state.copyWith(appStatus: AppStatus.initial));
  }
}
