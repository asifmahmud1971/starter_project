import 'package:demo/core/components/custom_svg.dart';
import 'package:demo/core/constants/app_text_style.dart';
import 'package:demo/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import 'custom_button.dart';

showCustomDialog({
  required BuildContext context,
  required VoidCallback onYes,
  String? title,
  String? details,
  String? confirmText,
  String? cancelText,
  bool isDivider = false,
  bool isCancelDisable = false,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: IntrinsicHeight(
          child: Container(
            padding: REdgeInsets.all(20.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12).r,
              color: AppColors.kWhiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: kTitleLarge.copyWith(color: AppColors.kGrayColor900),
                ),
                if (isDivider) ...[
                  12.verticalSpace,
                  const Divider(
                    color: AppColors.kGrayColor200,
                  ),
                ],
                if (details != null) ...[
                  12.verticalSpace,
                  Text(
                    details,
                    style: kBodyLarge.copyWith(color: AppColors.kGrayColor700),
                  ),
                ],
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (!isCancelDisable) ...[
                      SizedBox(
                        width: 1.sw / 4.5,
                        child: CustomButton(
                          onTap: () => Navigator.of(context).pop(),
                          title: cancelText ?? AppStrings.no.tr(),
                          textColor: AppColors.kGrayColor800,
                          backgroundColor: AppColors.kGrayColor100,
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          isGradientColor: false,
                        ),
                      ),
                      16.horizontalSpace,
                    ],
                    SizedBox(
                      width: 1.sw / 4.5,
                      child: CustomButton(
                        onTap: onYes,
                        title: confirmText ?? AppStrings.yes.tr(),
                        textColor: AppColors.kWhiteColor,
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

successAlert({
  required BuildContext context,
  required VoidCallback onYes,
  String? title,
  String? details,
  String? confirmText,
  String? cancelText,
  bool isCancelDisable = false,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pop(true);
      });
      return Dialog(
        child: IntrinsicHeight(
          child: Container(
            padding: REdgeInsets.all(20.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16).r,
              color: AppColors.kWhiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSvg(
                  icon: Assets.iconsHome,
                  size: 60.r,
                ),
                8.verticalSpace,
                Text(
                  title ?? "",
                  style: kTitleMedium.copyWith(color: AppColors.kGrayColor700),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
