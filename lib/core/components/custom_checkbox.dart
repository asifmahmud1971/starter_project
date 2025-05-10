import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';

class CustomCheckboxWidget extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final double? checkBoxHeight;
  final double? checkBoxWidth;

  const CustomCheckboxWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
    this.checkBoxHeight,
    this.checkBoxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: isSelected ? AppColors.selectLinearGradient : null,
        ),
        padding: REdgeInsets.all(2.w),
        child: AnimatedContainer(
          width: checkBoxWidth ?? 16.0.w,
          height: checkBoxHeight ?? 16.0.h,
          decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            shape: BoxShape.circle,
            border: isSelected == false
                ? Border.all(color: AppColors.kGrayColor400, width: 2.w)
                : null,
          ),
          duration: const Duration(microseconds: 200),
          child: (isSelected == true)
              ? Center(
                  child: RPadding(
                    padding: REdgeInsets.all(2.0),
                    child: const CustomSvg(icon: Assets.iconsTickMark),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
