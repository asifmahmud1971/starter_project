import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/model/medicine_alert_model.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/widget/action_button.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/widget/given_status_widget.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/widget/info_chip.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/widget/status_badge.dart';

class MedicineCardWidget extends StatelessWidget {
  final Alerts alert;

  const MedicineCardWidget({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
    final medicine = alert.medicine as String;
    final parts = medicine.split('<br>');
    final medicineName = parts[0].trim();
    final composition = parts.length > 1 ? parts[1].trim() : '';

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [AppColors.kBackGroundShadow],
          color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  medicineName,
                  style: kHeadLineSmall,
                ),
                StatusBadge(isGiven: alert.status != null),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.h, bottom: 12.h),
              child: Text(
                composition,
                style: kBodyMedium.copyWith(color: Colors.grey),
              ),
            ),
            Row(
              children: [
                InfoChip(
                    icon: Icons.medication,
                    text: '${AppStrings.dosage.tr()}: ${alert.dose}'),
                SizedBox(width: 12.w),
                InfoChip(icon: Icons.access_time, text: alert.time ?? ""),
              ],
            ),
            SizedBox(height: 16.h),
            alert.status != null
                ? GivenStatusWidget(status: alert.status!)
                : ActionButtons(actions: alert.actions),
          ],
        ),
      ),
    );
  }
}
