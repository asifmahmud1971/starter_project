import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';

void showCustomSnackBar({
  BuildContext? context,
  String? message,
  IconData? icon,
  bool isError = false,
  bool isCenterText = false,
}) {
  Flushbar(
    icon: Icon(
      icon ?? (isError ? Icons.warning_amber_rounded : Icons.check),
      color: AppColors.kWhiteColor,
    ),
    message: message ?? "",
    duration: const Duration(seconds: 3),
    margin: REdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    messageColor: isError ? AppColors.kWhiteColor : AppColors.kWhiteColor,
    textDirection: Directionality.of(context ?? GetContext.context),
    boxShadows: [AppColors.kBackGroundShadow],
    borderRadius: BorderRadius.circular(8).r,
    backgroundColor: isError ? AppColors.kError500 : AppColors.kSuccess500,
  ).show(GetContext.context);
}
