import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/pain_assessment.dart';

class PainAssessmentDialog extends StatelessWidget {
  final AllPainAssessment? entry;
  const PainAssessmentDialog({super.key, this.entry});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.painDetails.tr(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            16.verticalSpace,
            _buildDetailItem(AppStrings.location.tr(), entry?.painLocation??""),
            _buildDetailItem(AppStrings.radiation.tr(), entry?.radiation??""),
            _buildDetailItem(AppStrings.severity.tr(), entry?.severity??""),
            _buildDetailItem(AppStrings.pattern.tr(), entry?.changeOfTime??""),
            _buildDetailItem(
                AppStrings.relievingFactor.tr(), entry?.relievingFactors??""),
            _buildDetailItem(AppStrings.suspectedCause.tr(), entry?.causeOfPain??""),
            /*if (entry['notes'].isNotEmpty)
                  _buildDetailItem('Additional Notes', entry['notes']),*/
            24.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(AppStrings.close.tr()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style:  kRegular.copyWith(color: AppColors.kGrayColor500,fontSize: 12.sp),
          ),
          4.verticalSpace,
          Text(
            value.isNotEmpty ? value : 'Not specified',
            style: kRegular.copyWith(color: AppColors.kGrayColor600),
          ),
        ],
      ),
    );
  }



}
