import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/home/repository/home_repository.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(const HomeState());

  final HomeRepository homeRepository;

  Future<void> getDashboardPermission() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final response = await homeRepository.getDashboardPermission({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, dashboardPermission: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> getPrescription() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final response = await homeRepository.getPrescription({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, prescriptionModel: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }
}
