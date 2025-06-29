part of 'task_cubit.dart';

class TaskState extends Equatable {
  final AppStatus appStatus;
  final TaskModel? taskModel;

  const TaskState({
    this.appStatus = AppStatus.initial,
    this.taskModel,
  });

  TaskState copyWith({
    final AppStatus? appStatus,
    final TaskModel? taskModel,
  }) {
    return TaskState(
      appStatus: appStatus ?? this.appStatus,
      taskModel: taskModel ?? this.taskModel,
    );
  }

  @override
  List<Object> get props => [
        appStatus,
        taskModel ?? {},
      ];
}
