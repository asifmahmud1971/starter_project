import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/model/medicine_alert_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ActionButtons extends StatelessWidget {
  final MedicineAlertActions? actions;
  const ActionButtons({super.key, required this.actions});

  Future<void> _launchUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${AppStrings.couldNotLaunch.tr()} $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            icon: Icon(Icons.check, size: 20.sp),
            label: Text(
              AppStrings.markAsGiven.tr(),
              style: kButtonLargeStyle.copyWith(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kGivenColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            onPressed: () {
              if (actions != null) {
                _launchUrl(context, actions!.givenUrl as String);
              }
            },
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: OutlinedButton.icon(
            icon: Icon(Icons.close, size: 20.sp),
            label: Text(
              AppStrings.notGiven.tr(),
              style: kButtonLargeStyle.copyWith(color: AppColors.kNotGivenColor),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.kNotGivenColor,
              side: BorderSide(color: AppColors.kNotGivenColor),
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            onPressed: () {
              if (actions != null) {
                _launchUrl(context, actions!.notGivenUrl as String);
              }
            },
          ),
        ),
      ],
    );
  }
}
