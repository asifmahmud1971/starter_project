import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/app/app_context.dart';
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
  Future<void> updateTaskData({String? type, int? id}) async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading));
    try {
      final response = await staffPortalRepository.taskStatusUpdate(type,id);

      response.fold(
        (failure) {},
        (data) async {
          ScaffoldMessenger.of(GetContext.context).showSnackBar(
            SnackBar(content: Text('Updating status to $type')),
          );
          emit(state.copyWith(
              appStatus: AppStatus.initial));
          final index = state.taskModel?.tasks?.indexWhere((e)=>e.taskId == data.data?.taskId);

          state.taskModel?.tasks?[index??0] = data.data??StaffTasks();
          emit(state.copyWith(appStatus: AppStatus.success,taskModel: state.taskModel));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }
}
