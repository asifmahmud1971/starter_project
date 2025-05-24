import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medPilot/core/constants/app_colors.dart';

class BuildDateTimeCard extends StatelessWidget {
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;

  final Function()? onSelectDate;
  final Function()? onSelectTime;

  const BuildDateTimeCard(
      {super.key,
      this.selectedDate,
      this.selectedTime,
      this.onSelectDate,
      this.onSelectTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [AppColors.kBackGroundShadow],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today,
              color: AppColors.kPrimaryColor,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Date & Time',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          icon: Icon(
                            Icons.calendar_month,
                            size: 18,
                            color:
                                AppColors.kPrimaryColor.withValues(alpha: 0.8),
                          ),
                          label: Text(
                            DateFormat('MMM dd, yyyy').format(selectedDate!),
                          ),
                          style: FilledButton.styleFrom(
                            backgroundColor:
                                AppColors.kPrimaryColor.withValues(alpha: 0.2),
                            foregroundColor:
                                AppColors.kPrimaryColor.withValues(alpha: 0.8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: onSelectDate,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton.icon(
                          icon: const Icon(Icons.access_time, size: 18),
                          label: Text(selectedTime!.format(context)),
                          style: FilledButton.styleFrom(
                            backgroundColor:
                                AppColors.kPrimaryColor.withValues(alpha: 0.2),
                            foregroundColor: AppColors.kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: onSelectTime,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
