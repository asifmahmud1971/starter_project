
import 'package:flutter/material.dart';
import 'package:medPilot/core/constants/app_colors.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    if (status == "Completed") {
      statusColor = AppColors.kCompletedColor;
    } else if (status == "Start Work") {
      statusColor = AppColors.kInProgressColor;
    } else {
      statusColor = AppColors.kPendingColor;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: statusColor, width: 1.5),
      ),
      child: Text(status,
          style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 14)),
    );
  }
}