import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/view/medicine_alert_page.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/widget/status_indicator_widget.dart';

import '../model/medicine_alert_model.dart';

class StatusSummaryWidget extends StatelessWidget {
  final List<Alerts> alerts;
  const StatusSummaryWidget({super.key, required this.alerts});

  @override
  Widget build(BuildContext context) {
    final givenCount = alerts.where((a) => a.status != null).length;
    final pendingCount = alerts.length - givenCount;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatusIndicator(label: AppStrings.given.tr(), count: givenCount, color: AppColors.kGivenColor),
          StatusIndicator(label: AppStrings.pending.tr(), count: pendingCount, color: AppColors.kPendingColor),
          StatusIndicator(label: AppStrings.total.tr(), count: alerts.length, color: AppColors.kPrimaryColor),
        ],
      ),
    );
  }
}