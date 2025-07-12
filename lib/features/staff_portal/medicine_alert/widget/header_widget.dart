import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/core/utils/extension.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/model/medicine_alert_model.dart';

class GivenStatusWidget extends StatelessWidget {
  final MedicineAlertStatus status;
  const GivenStatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.kGivenColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.kGivenColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: AppColors.kGivenColor, size: 20.sp),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.medicineAdministered.tr(),
                style: kLabelLargeProminent,
              ),
              SizedBox(height: 4.h),
              Text(
                '${AppStrings.givenAt.tr()} ${status.date?.toTimeHmA}',
                style: kLabelMedium.copyWith(color: Colors.grey.shade600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.kPrimaryColor.withOpacity(0.2),
            blurRadius: 10.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.medicationSchedule.tr(),
                style: kTitleMedium.copyWith(color: Colors.white),
              ),
              SizedBox(height: 4.h),
              Text(
                DateFormat('EEEE, MMMM d').format(DateTime.now()),
                style: kLabelMedium.copyWith(color: Colors.white70),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.medication, color: Colors.white, size: 28.sp),
          ),
        ],
      ),
    );
  }
}
