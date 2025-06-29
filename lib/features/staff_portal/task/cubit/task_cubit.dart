import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/procedure_model.dart';
import 'package:medPilot/features/staff_portal/repository/staffPortal_repository.dart';
import 'package:medPilot/features/staff_portal/roaster/model/roster_model.dart';
import 'package:medPilot/features/staff_portal/task/model/task_model.dart';

part 'task_state.dart';

@injectable
class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.staffPortalRepository) : super(const TaskState());

  final StaffPortalRepository staffPortalRepository;

  Future<void> getTaskData() async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading, taskModel: TaskModel()));
    try {
      final response = await staffPortalRepository.getTask({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(appStatus: AppStatus.success, taskModel: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }
}
