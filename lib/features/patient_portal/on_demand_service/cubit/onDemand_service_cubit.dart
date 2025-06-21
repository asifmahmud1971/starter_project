import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/home/repository/home_repository.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/home_visit_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/procedure_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/repository/onDemandService_repository.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';
import 'package:medPilot/features/patient_portal/services/repository/service_repository.dart';

part 'onDemand_service_state.dart';

@injectable
class OnDemandServiceCubit extends Cubit<OnDemandServiceState> {
  OnDemandServiceCubit(this.onDemandServiceRepository) : super(const OnDemandServiceState());

  final OnDemandServiceRepository onDemandServiceRepository;


  Future<void> getHomeVisit() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final response = await onDemandServiceRepository.getHomeVisit({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, homeVisitModel: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }
  Future<void> getProcedure() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading,homeVisitModel: HomeVisitModel()));

    try {
      final response = await onDemandServiceRepository.getProcedure({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, procedureModel: data));
        },
      );
      log("procedure Data ---------> ${state.homeVisitModel?.success}");

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }
}
