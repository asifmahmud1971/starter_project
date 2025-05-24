import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_date_time_formatter.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/pain_assessment.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/widget/pain_assessment_dialog.dart';

class PainAssessment extends StatefulWidget {
  final AllPainAssessment? entry;
  const PainAssessment({super.key, this.entry});

  @override
  State<PainAssessment> createState() => _PainAssessmentState();
}

class _PainAssessmentState extends State<PainAssessment> {
  final dateFormat = DateFormat('MMM dd, yyyy');
  final timeFormat = DateFormat('h:mm a');
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [AppColors.kBackGroundShadow],
          borderRadius: BorderRadius.circular(8.r)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: () => _showDetailsDialog(widget.entry??AllPainAssessment()),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.entry?.painLocation??"",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color:
                      _getSeverityColor(widget.entry?.severity??"").withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: _getSeverityColor(widget.entry?.severity??""),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      widget.entry?.severity??"",
                      style: TextStyle(
                        color: _getSeverityColor(widget.entry?.severity??""),
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 14.r,
                    color: AppColors.kGrayColor500,
                  ),
                  4.horizontalSpace,
                  Text(
                    dateFormat.format(widget.entry?.date?.toDate()??DateTime.now()),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  12.horizontalSpace,
                  Icon(
                    Icons.access_time,
                    size: 14,
                    color: Colors.grey[500],
                  ),
                  4.horizontalSpace,
                  Text(
                    timeFormat.format(widget.entry?.date?.toDate()??DateTime.now()),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              12.verticalSpace,
              if ((widget.entry?.radiation??"").isNotEmpty)
                _buildDetailRow('${AppStrings.radiation.tr()}:', widget.entry?.radiation??""),
              8.verticalSpace,
              Divider(height: 1, color: Colors.grey[200]),
              8.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.viewDetails.tr(),
                    style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.kPrimaryColor,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: kRegular.copyWith(fontSize: 13.sp,color: AppColors.kGrayColor700,fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getSeverityColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'mild':
        return Colors.green;
      case 'moderate':
        return AppColors.kPrimaryColor;
      case 'severe':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _showDetailsDialog(AllPainAssessment? entry) {
    showDialog(
      context: context,
      builder: (context) {
        return PainAssessmentDialog(entry: entry,);
      },
    );
  }



}
