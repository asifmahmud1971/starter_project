import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/components/custom_snack_bar.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/assign_shift_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/city_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/consultants_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/current_package_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/on_sarevice_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/procedure_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/thana_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/repository/onDemandService_repository.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';

part 'onDemand_service_state.dart';

@injectable
class OnDemandServiceCubit extends Cubit<OnDemandServiceState> {
  OnDemandServiceCubit(this.onDemandServiceRepository)
      : super(const OnDemandServiceState());

  final OnDemandServiceRepository onDemandServiceRepository;
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController currentPackageController =
      TextEditingController();
  final TextEditingController startServiceDateController =
      TextEditingController();
  final TextEditingController representativeNameController =
      TextEditingController();
  final TextEditingController mobileNoPrimaryController =
      TextEditingController();
  final TextEditingController mobileNoAlternativeController =
      TextEditingController();
  final TextEditingController representativeEmailController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();
  String? selectGender;
  City? selectCity;
  Thana? selectThana;
  String? selectPatientPackage;
  DateTime? selectedDate;
  List<String> genderList = ['Male', 'Female', 'Other'];
  FormFieldValidator<String>? validator =
      (value) => (value ?? "").isEmpty ? 'This field is required' : null;

  Future<void> getHomeVisit() async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading, onService: OnServiceModel()));

    try {
      final response = await onDemandServiceRepository.getHomeVisit({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(appStatus: AppStatus.success, onService: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> getProcedure() async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading, onService: OnServiceModel()));

    try {
      final response = await onDemandServiceRepository.getProcedure({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(appStatus: AppStatus.success, onService: data));
        },
      );
      log("procedure Data ---------> ${state.onService?.success}");

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> getAlliedHealth() async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading, onService: OnServiceModel()));

    try {
      final response = await onDemandServiceRepository.getAlliedHealth({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(appStatus: AppStatus.success, onService: data));
        },
      );
      log("procedure Data ---------> ${state.onService?.success}");

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> getPharmacy() async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading, onService: OnServiceModel()));

    try {
      final response = await onDemandServiceRepository.getPharmacy({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(appStatus: AppStatus.success, onService: data));
        },
      );
      log("procedure Data ---------> ${state.onService?.success}");

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> getLab() async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading, onService: OnServiceModel()));

    try {
      final response = await onDemandServiceRepository.getLab({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(appStatus: AppStatus.success, onService: data));
        },
      );
      log("procedure Data ---------> ${state.onService?.success}");

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> getInstrumentRate() async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading, onService: OnServiceModel()));

    try {
      final response = await onDemandServiceRepository.getInstrument({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(appStatus: AppStatus.success, onService: data));
        },
      );
      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> getPatientPackage() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final response = await onDemandServiceRepository.getPatientPackage({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, currentPackage: data));
        },
      );
      log("procedure Data ---------> ${state.onService?.success}");

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> getCity() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final response = await onDemandServiceRepository.getCity({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(appStatus: AppStatus.success, city: data));
        },
      );
      log("procedure Data ---------> ${state.onService?.success}");

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> getThana({int? id}) async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final response = await onDemandServiceRepository.getThana({}, id);

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(appStatus: AppStatus.success, thana: data));
        },
      );
      log("procedure Data ---------> ${state.onService?.success}");

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> getConsultants() async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading, onService: OnServiceModel()));

    try {
      final response = await onDemandServiceRepository.getConsultants({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, consultantsResponse: data));
        },
      );
      log("procedure Data ---------> ${state.onService?.success}");

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> getAssignStaff() async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading, onService: OnServiceModel()));

    try {
      final response = await onDemandServiceRepository.getAssignStaff({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, assignStaffModel: data));
        },
      );
      log("assignStaffData  ---------> ${state.onService?.success}");

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> addClinic() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final formData = <String, dynamic>{};
      formData['patient_name'] = patientNameController.text;
      formData['age'] = ageController.text;
      formData['gender'] = selectGender ?? "";
      formData['legal_representive_name'] = representativeNameController.text;
      formData['mobile_no'] = mobileNoPrimaryController.text;
      formData['legal_representive_email'] = representativeEmailController.text;

      formData['city_id'] = selectCity?.id ?? "";
      formData['thana_id'] = selectThana?.id ?? "";
      formData['address'] = addressController.text;
      formData['phone'] = phoneController.text;
      formData['email'] = emailController.text;
      formData['request_package'] = currentPackageController.text;
      formData['whenDate'] = startServiceDateController.text;
      formData['legalReName'] = representativeNameController.text;
      formData['legalMobileNo'] = mobileNoPrimaryController.text;

      final response =
          await onDemandServiceRepository.inPatientPackage(formData);

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
