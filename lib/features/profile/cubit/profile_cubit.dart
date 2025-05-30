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
import 'package:medPilot/core/constants/app_print.dart';
import 'package:medPilot/core/enum/app_status.dart';
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
  final dateOfBirthController = TextEditingController();
  final mobileNoController = TextEditingController();
  final doctorContactController = TextEditingController();
  final cityController = TextEditingController();
  final thanaController = TextEditingController();
  final presentAddressController = TextEditingController();
  final landMarkController = TextEditingController();
  final permanentAddressController = TextEditingController();
  final nIDPassportController = TextEditingController();
  final familyContactPersonController = TextEditingController();
  final familyContactNumberController = TextEditingController();
  final allergiesController = TextEditingController();
  final primaryDiagnosisController = TextEditingController();
  final coMorbidityController = TextEditingController();

  String? selectBloodGroup;
  String? selectMaritalStatus;
  String? selectGender;

  List<String> bloodGroupList = [
    'A+',
    'B+',
    'AB+',
    'O+',
    'A-',
    'B-',
    'AB-',
    'O-'
  ];
  List<String> maritalStatusList = [
    'Married',
    'Single',
    'Widow',
    'Separated',
    'Divorced'
  ];
  List<String> genderList = [
    'Male',
    'Female',
    'Other'
  ];


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
            message: AppStrings.somethingWentWrong.tr(),
          );

          emit(state.copyWith(appStatus: AppStatus.failure));
        },
        (r) async {
          emit(state.copyWith(appStatus: AppStatus.success,profileDetails: r.profileDetails));
          userDataSaveProfile(profileDetails: state.profileDetails);
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
      emit(state.copyWith(appStatus: AppStatus.failure));
      log('$runtimeType:: @signIn => $e');
    }
  }

  void userDataSaveProfile({ProfileDetails? profileDetails}) {
    nameController.text = profileDetails?.patientName ?? "";
    selectGender = profileDetails?.gender;
    dateOfBirthController.text = profileDetails?.dob ?? "";
    selectBloodGroup = profileDetails?.bloodGroup;
    selectMaritalStatus = profileDetails?.maritalStatus;
    mobileNoController.text = profileDetails?.phone ?? "";
    doctorContactController.text = profileDetails?.doctorContactNo ?? "";
    cityController.text = profileDetails?.cityId.toString() ?? "";
    thanaController.text = profileDetails?.thanaId.toString() ?? "";
    presentAddressController.text = profileDetails?.presentAddress ?? "";
    landMarkController.text = profileDetails?.landMark ?? "";
    permanentAddressController.text = profileDetails?.permanentAddress ?? "";
    nIDPassportController.text = profileDetails?.nidPassport ?? "";
    familyContactNumberController.text = profileDetails?.contactPersonNumber ?? "";
    familyContactPersonController.text = profileDetails?.familyContactPerson ?? "";
    allergiesController.text = profileDetails?.allergy ?? "";
    primaryDiagnosisController.text = profileDetails?.primaryDiagnosis ?? "";
  }

  Future<void> updateProfile() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final formData = <String, dynamic>{
        "patient_name": nameController.text,
        "gender": selectGender??"",
        "dob": dateOfBirthController.text,
        "blood_group": selectBloodGroup??"",
        "marital_status": selectMaritalStatus??"",
        "phone": mobileNoController.text,
        "doctor_contact_no": doctorContactController.text,
        "city_id": cityController.text,
        "thana_id": thanaController.text,
        "present_address": presentAddressController.text,
        "land_mark": landMarkController.text,
        "permanent_address": permanentAddressController.text,
        "nid_passport": nIDPassportController.text,
        "contact_person_number": familyContactNumberController.text,
        "family_contact_person": familyContactPersonController.text,
        "relation_family_contract_person": "",
        "allergy": allergiesController.text,
        "primary_diagnosis": primaryDiagnosisController.text
      } ;
      final response = await _profileRepository.updateUserData(formData);

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
          GetContext.back();
          faceUserData();
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

  void resetForm() {
    nameController.clear();
    emit(state.copyWith(appStatus: AppStatus.initial));
  }
}
