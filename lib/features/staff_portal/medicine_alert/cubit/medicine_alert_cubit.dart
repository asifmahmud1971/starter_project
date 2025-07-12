import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/procedure_model.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/model/medicine_alert_model.dart';
import 'package:medPilot/features/staff_portal/repository/staffPortal_repository.dart';
import 'package:medPilot/features/staff_portal/roaster/model/roster_model.dart';

part 'medicine_alert_state.dart';

@injectable
class MedicineAlertCubit extends Cubit<MedicineAlertState> {
  MedicineAlertCubit(this.staffPortalRepository) : super(const MedicineAlertState());

  final StaffPortalRepository staffPortalRepository;

  Future<void> getMedicineAlertData() async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading, medicineAlertModel: MedicineAlertModel()));
    try {
      final response = await staffPortalRepository.getMedicineAlertData({});

      response.fold(
            (failure) {},
            (data) async {
          emit(state.copyWith(appStatus: AppStatus.success, medicineAlertModel: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }


}
