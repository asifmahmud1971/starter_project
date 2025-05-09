import 'package:demo/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//font family

String kHankenGroteskFamily = 'HankenGrotesk';

//font Weights
FontWeight regularFont = FontWeight.w400;
FontWeight semiBoldFont = FontWeight.w600;
FontWeight boldFont = FontWeight.w700;
FontWeight extraBoldFont = FontWeight.w800;

//App Text Size start
final kHeadLineLarge = TextStyle(
  fontSize: 32.sp,
  fontWeight: extraBoldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
);

final kHeadLineMedium = TextStyle(
  fontSize: 24.sp,
  fontWeight: extraBoldFont,
  height: 1.28,
  color: AppColors.kTextPrimaryColor,
);
final kHeadLineSmall = TextStyle(
  fontSize: 16.sp,
  fontWeight: boldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
);
final kHeadLineSmallHeavy = TextStyle(
  fontSize: 16.sp,
  fontWeight: extraBoldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);
final kHeadLineExtraSmallHeavy = TextStyle(
  fontSize: 14.sp,
  fontWeight: extraBoldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);

final kTitleLarge = TextStyle(
  fontSize: 20.sp,
  fontWeight: boldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
);
final kTitleMedium = TextStyle(
  fontSize: 16.sp,
  fontWeight: semiBoldFont,
  height: 1.3,
  color: AppColors.kTextPrimaryColor,
);
final kTitleSmall = TextStyle(
  fontSize: 14.sp,
  fontWeight: boldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);

final kBodyLarge = TextStyle(
  fontSize: 16.sp,
  fontWeight: regularFont,
  height: 1.4,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);
final kBodyMedium = TextStyle(
  fontSize: 14.sp,
  fontWeight: regularFont,
  height: 1.5,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);
final kBodySmall = TextStyle(
  fontSize: 12.sp,
  fontWeight: regularFont,
  height: 1.4,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);

final kLabelLarge = TextStyle(
  fontSize: 14.sp,
  fontWeight: regularFont,
  height: 1.36,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);
final kLabelLargeProminent = TextStyle(
  fontSize: 14.sp,
  fontWeight: boldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);
final kLabelExtraLargeProminent = TextStyle(
  fontSize: 16.sp,
  fontWeight: semiBoldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);
final kLabelMedium = TextStyle(
  fontSize: 12.sp,
  fontWeight: regularFont,
  height: 1.15,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);
final kLabelMediumProminent = TextStyle(
  fontSize: 12.sp,
  fontWeight: boldFont,
  height: 1.1,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);
final kLabelSmall = TextStyle(
  fontSize: 10.sp,
  fontWeight: regularFont,
  height: 1.1,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);
final kLabelSmallProminent = TextStyle(
  fontSize: 10.sp,
  fontWeight: boldFont,
  height: 1.1,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);

final kButtonLargeStyle = TextStyle(
  fontSize: 16.sp,
  fontWeight: boldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);

final kTFInputTextDefault = TextStyle(
  fontSize: 14.sp,
  fontWeight: regularFont,
  height: 1.4,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);
final kTFInputTextFocused = TextStyle(
  fontSize: 14.sp,
  fontWeight: semiBoldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);
final kTFLabelText = TextStyle(
  fontSize: 14.sp,
  fontWeight: boldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);

final kTFSupportingText = TextStyle(
  fontSize: 14.sp,
  fontWeight: regularFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);

final kOtherLargeProminent = TextStyle(
  fontSize: 20.sp,
  fontWeight: boldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);
final kOtherToast = TextStyle(
  fontSize: 16.sp,
  fontWeight: semiBoldFont,
  height: 1.4,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);
final kOtherLink = TextStyle(
  fontSize: 14.sp,
  fontWeight: semiBoldFont,
  height: 1.5,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);

final kLabelExtraLarge = TextStyle(
  fontSize: 16.sp,
  fontWeight: semiBoldFont,
  height: 1.5,
  color: AppColors.kTextPrimaryColor,
  fontFamily: kHankenGroteskFamily,
);
