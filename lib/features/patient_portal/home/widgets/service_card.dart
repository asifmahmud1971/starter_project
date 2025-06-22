import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';

class ServiceCard extends StatelessWidget {
  final String? title;
  final String? icon;
  final VoidCallback? onTap;

  const ServiceCard({super.key, this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: AppColors.kWhiteColor,
            boxShadow: [AppColors.backgroundShadow]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor.withValues(alpha: 0.2),shape: BoxShape.circle),
                child: CustomSvg(
                  icon: icon ?? "",
                  size: 48.r,
                ),
              ),
            ),
            8.verticalSpace,
            Text(title ?? "",
                maxLines: 1,
                textAlign: TextAlign.center,
                style: kBodyLarge.copyWith(color: Colors.black))
          ],
        ),
      ),
    );
  }
}
