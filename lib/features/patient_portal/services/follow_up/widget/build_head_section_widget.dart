import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_colors.dart';

class BuildHeadSectionWidget extends StatelessWidget {
  final String? title;
  final IconData? icon;

  const BuildHeadSectionWidget({super.key, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.kPrimaryColor),
          8.horizontalSpace,
          Text(
            title ?? "",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
