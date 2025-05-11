import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/home/model/service_model.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel? serviceModel;

  const ServiceCard({super.key, this.serviceModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: AppColors.kWhiteColor,
          boxShadow: [AppColors.backgroundShadow]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSvg(
            icon: serviceModel?.icon ?? "",
            size: 40.r,
          ),
          10.verticalSpace,
          Text(
            serviceModel?.title ?? "",
            textAlign: TextAlign.center,
            style: kBodyMedium,
          )
        ],
      ),
    );
  }
}
