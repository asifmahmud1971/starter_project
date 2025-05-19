import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/home/model/service_model.dart';
import 'package:medPilot/features/patient_portal/services/view/pescription_page.dart';

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
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: AppColors.kWhiteColor,
            boxShadow: [AppColors.backgroundShadow]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvg(
              icon: icon ?? "",
              size: 40.r,
            ),
            10.verticalSpace,
            Text(
              title ?? "",
              textAlign: TextAlign.center,
              style: kBodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
