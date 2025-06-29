// File: main.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medPilot/core/constants/app_colors.dart';
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

  @override
  void initState() {
    super.initState();

    context.read<TaskCubit>().getTaskData();
  }

  void _updateTaskStatus(StatusOptions option) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Updating status to ${option.label}')),
    );
  }

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<TaskCubit, TaskState>(

      builder: (context, state) {
        final pending = state.taskModel?.tasks?.where((t) => t.status == "0").length;
        final inProgress = state.taskModel?.tasks?.where((t) => t.status == "1").length;
        final completed = state.taskModel?.tasks?.where((t) => t.status == "2").length;
        return Scaffold(
          appBar: AppBar(
            title:  Text(AppStrings.taskManager.tr()),
            actions: [
              IconButton(icon: const Icon(Icons.refresh), onPressed: () => setState(() {})),
            ],
          ),
          body: Column(
            children: [
              HeaderStats(pending: pending??0, inProgress: inProgress??0, completed: completed??0),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.taskModel?.tasks?.length,
                  itemBuilder: (context, index) => TaskCard(
                    task: state.taskModel?.tasks?[index]??StaffTasks(),
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

// File: models/task_model.dart
class TaskResponse {
  final bool success;
  final String token;
  final String tokenType;
  final List<Task> tasks;

  TaskResponse({required this.success, required this.token, required this.tokenType, required this.tasks});

  factory TaskResponse.sample() {
    return TaskResponse(
      success: true,
      token: "token",
      tokenType: "Bearer",
      tasks: [
        Task(
          taskId: 1,
          title: "Design UI",
          description: "Create mobile UI",
          assignDate: "21-06-2025",
          lastDate: "30-06-2025",
          status: "0",
          statusOptions: [
            StatusOption(label: "Pending", value: 0, url: "", selected: true),
            StatusOption(label: "Start Work", value: 1, url: "", selected: false),
            StatusOption(label: "Complete", value: 2, url: "", selected: false),
          ],
        ),
      ],
    );
  }
}

class Task {
  final int taskId;
  final String title;
  final String description;
  final String assignDate;
  final String lastDate;
  final String status;
  final List<StatusOption> statusOptions;

  Task({
    required this.taskId,
    required this.title,
    required this.description,
    required this.assignDate,
    required this.lastDate,
    required this.status,
    required this.statusOptions,
  });

  StatusOption? get selectedStatusOption =>
      statusOptions.firstWhere((o) => o.selected, orElse: () => statusOptions[0]);
}

class StatusOption {
  final String label;
  final int value;
  final String url;
  final bool selected;

  StatusOption({required this.label, required this.value, required this.url, required this.selected});
}











