import 'package:demo/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

showProgressDialog() {
  if (!EasyLoading.isShow) {
    EasyLoading.show(
      dismissOnTap: false,
    );
  }
}

dismissProgressDialog() {
  if (EasyLoading.isShow) {
    EasyLoading.dismiss();
  }
}

void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..maskColor = Colors.transparent
    ..textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 18,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w400,
    )
    ..backgroundColor =
        Colors.transparent // Background color of the loading indicator
    ..indicatorColor =
        AppColors.kWhiteColor // Color of the loading indicator itself
    ..textColor = Colors.white // Color of the text// Color of the mask

    ..userInteractions = false
    ..boxShadow = [];
}
