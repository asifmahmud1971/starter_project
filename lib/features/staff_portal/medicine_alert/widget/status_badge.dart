import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';

class StatusBadge extends StatelessWidget {
  final bool isGiven;
  const StatusBadge({super.key, required this.isGiven});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isGiven
            ? AppColors.kGivenColor.withOpacity(0.1)
            : AppColors.kPendingColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isGiven ? AppColors.kGivenColor : AppColors.kPendingColor,
          width: 1.5,
        ),
      ),
      child: Text(
        isGiven ? AppStrings.given.tr() : AppStrings.pending.tr(),
        style: TextStyle(
          color: isGiven ? AppColors.kGivenColor : AppColors.kPendingColor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}