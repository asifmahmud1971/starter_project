import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/staff_portal/task/model/task_model.dart';
import 'package:medPilot/features/staff_portal/task/view/staff_task_screen.dart';
import 'package:medPilot/features/staff_portal/task/widget/date_info.dart';
import 'package:medPilot/features/staff_portal/task/widget/status_badge.dart';

class TaskCard extends StatelessWidget {
  final StaffTasks task;
  final Function(StatusOptions) onStatusUpdate;

  const TaskCard({super.key, required this.task, required this.onStatusUpdate});

  @override
  Widget build(BuildContext context) {
    final assignDate = _parseDate(task.assignDate??"");
    final lastDate = _parseDate(task.lastDate??"");
    final daysRemaining = lastDate?.difference(DateTime.now()).inDays;
    final dateFormat = DateFormat('dd-MM-yyyy');

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [AppColors.kBackGroundShadow],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(task.title??"",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              if (task.selectedStatusOption != null)
                StatusBadge(status: task.selectedStatusOption?.label??""),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              DateInfo(label: "Assign Date", date: dateFormat.format(assignDate ?? DateTime.now())),
              const SizedBox(width: 8),
              DateInfo(label: "Last Date", date: dateFormat.format(lastDate ?? DateTime.now())),
            ],
          ),
          const SizedBox(height: 12),
          Text(task.description??"", style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 12),
          if (daysRemaining != null && task.status != "2")
            Text("$daysRemaining days remaining",
                style: TextStyle(
                  color: daysRemaining < 3 ? Colors.red : Colors.grey,
                  fontWeight: FontWeight.w500,
                )),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: (task.statusOptions??[]).map((option) {
              final isSelected = option.selected;
              return ActionChip(
                label: Text(option.label??"",
                    style: TextStyle(
                      color: isSelected??false ? Colors.white : AppColors.kPrimaryColor,
                    )),
                backgroundColor:
                isSelected??false ? AppColors.kPrimaryColor : Colors.transparent,
                onPressed: () => onStatusUpdate(option),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  DateTime? _parseDate(String dateStr) {
    try {
      final parts = dateStr.split('-');
      return DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
    } catch (_) {
      return null;
    }
  }
}