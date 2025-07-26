// File: main.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/features/staff_portal/task/cubit/task_cubit.dart';
import 'package:medPilot/features/staff_portal/task/model/task_model.dart';
import 'package:medPilot/features/staff_portal/task/widget/header_stats.dart';
import 'package:medPilot/features/staff_portal/task/widget/task_card.dart';

class TaskManagementScreen extends StatefulWidget {
  const TaskManagementScreen({super.key});

  @override
  State<TaskManagementScreen> createState() => _TaskManagementScreenState();
}

class _TaskManagementScreenState extends State<TaskManagementScreen> {
  TaskCubit? taskCubit;

  @override
  void initState() {
    super.initState();
    taskCubit = context.read<TaskCubit>();
    context.read<TaskCubit>().getTaskData();
  }

  void _updateTaskStatus(StatusOptions option) {
    taskCubit?.updateTaskData(type: option.label, id: option.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        final pending =
            state.taskModel?.tasks?.where((t) => t.status == "0").length;
        final inProgress =
            state.taskModel?.tasks?.where((t) => t.status == "1").length;
        final completed =
            state.taskModel?.tasks?.where((t) => t.status == "2").length;
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.taskManager.tr()),
            actions: [
              IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () => setState(() {})),
            ],
          ),
          body: Column(
            children: [
              HeaderStats(
                  pending: pending ?? 0,
                  inProgress: inProgress ?? 0,
                  completed: completed ?? 0),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.taskModel?.tasks?.length,
                  itemBuilder: (context, index) => TaskCard(
                    task: state.taskModel?.tasks?[index] ?? StaffTasks(),
                    onStatusUpdate: _updateTaskStatus,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
