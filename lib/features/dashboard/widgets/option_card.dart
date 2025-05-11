import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/generated/assets.dart';

class DrawerOptionCard extends StatelessWidget {
  final String? icon;
  final String? title;
  final VoidCallback? onTap;
  final bool isSub;

  const DrawerOptionCard({
    super.key,
    this.icon,
    this.title,
    this.isSub = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isSub
                ? Image.asset(
                    icon ?? Assets.iconsPlaceholderViewVector,
                    height: 18.r,
                    width: 18.r,
                  )
                : CustomSvg(
                    icon: icon ?? Assets.iconsHome,
                    color: AppColors.kPrimarySpeechBlue,
                    size: isSub ? 20.r : 24.r,
                  ),
            10.horizontalSpace,
            Flexible(
              child: Text(
                title ?? "",
                style: kBodyLarge.copyWith(
                  color: isSub
                      ? AppColors.kTextPrimaryColor
                      : AppColors.kPrimarySpeechBlue,
                  fontWeight: isSub ? FontWeight.w400 : FontWeight.w600,
                  fontSize: isSub ? 14.sp : 16.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
