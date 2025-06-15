import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_date_time_formatter.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/services/invesigation/model/investigation_response.dart';

class PatientInformation extends StatelessWidget {
  final PatientInfo? patientInfo;

  const PatientInformation({super.key, this.patientInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            patientInfo?.name ?? "",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          8.verticalSpace,
          Row(
            children: [
              Icon(
                Icons.cake,
                color: Colors.black,
                size: 16,
              ),
              8.horizontalSpace,
              Text(
                '${patientInfo?.age} ${AppStrings.years.tr()} • ${patientInfo?.gender}',
                style: kBodyMedium,
              ),
            ],
          ),
          8.verticalSpace,
          Row(
            children: [
              Icon(
                Icons.phone,
                color: Colors.black,
                size: 16.r,
              ),
              8.horizontalSpace,
              Text(
                '${patientInfo?.mobile}',
                style: kBodyMedium,
              ),
            ],
          ),
          8.verticalSpace,
          Row(
            children: [
              const Icon(
                Icons.medical_services,
                color: Colors.black,
                size: 16,
              ),
              8.horizontalSpace,
              Text(
                '${patientInfo?.consultingDoctor}',
                style: kBodyMedium,
              ),
            ],
          ),
          8.verticalSpace,
          Row(
            children: [
              const Icon(
                Icons.access_time,
                color: Colors.black,
                size: 16,
              ),
              8.horizontalSpace,
              Text(
                "${AppStrings.lastUpdate.tr()}: ${patientInfo?.updatedAt?.toFormattedDateTime}",
                style: kBodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}