import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_strings.dart';

enum EmptyType {
  gallery,
}

class CustomEmptyBody extends StatelessWidget {
  final String? icons;
  final String? title;

  const CustomEmptyBody({
    super.key,
    this.icons,
    this.title,
  });

  Widget getEmptyBody({EmptyType? type}) {
    switch (type) {
      case EmptyType.gallery:
        return CustomEmptyBody(
          icons: Assets.imagesMusicEmpty,
          title: AppStrings.noPageFound.tr(),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSvg(
          icon: icons ?? Assets.iconsMusicNoteEmpty,
          size: 40.r,
        ),
        SizedBox(height: 10.h),
        Text(
          title ?? "",
          style: kBodyLarge.copyWith(color: AppColors.kGrayColor900),
        ),
        SizedBox(height: 50.h),
      ],
    );
  }
}
