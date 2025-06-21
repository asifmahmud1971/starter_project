import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/procedure_model.dart';
import 'package:medPilot/features/staff_portal/repository/staffPortal_repository.dart';
import 'package:medPilot/features/staff_portal/roaster/model/roster_model.dart';

part 'roster_state.dart';

@injectable
class RosterCubit extends Cubit<RosterState> {
  RosterCubit(this.staffPortalRepository) : super(const RosterState());

  final StaffPortalRepository staffPortalRepository;

  Future<void> getRosterData() async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading, rosterModel: RosterModel()));
    try {
      final response = await staffPortalRepository.getRosterData({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(appStatus: AppStatus.success, rosterModel: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }
}
