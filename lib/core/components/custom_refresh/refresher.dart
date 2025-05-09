import 'package:demo/core/components/custom_refresh/pull_to_refresh.dart';
import 'package:demo/core/constants/app_colors.dart';
import 'package:demo/core/constants/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget customRefresher({
  required RefreshController controller,
  required VoidCallback? onRefresh,
  VoidCallback? onLoading,
  List<Widget>? children,
  Widget? child,
  bool enablePullUp = false,
  ScrollController? scrollController,
}) {
  return SmartRefresher(
    scrollController: scrollController,
    onRefresh: onRefresh,
    onLoading: enablePullUp ? onLoading : null,
    // cacheExtent: 9999,
    header: const WaterDropMaterialHeader(
      backgroundColor: AppColors.kPrimarySpeechBlue,
      color: Colors.white,
    ),
    footer: CustomFooter(
      builder: (BuildContext? context, LoadStatus? mode) {
        Widget? body;
        if (mode == LoadStatus.idle) {
          body = const SizedBox();
        } else if (mode == LoadStatus.loading) {
          body = Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.kBorderOrangeColor,
                ),
              ),
              const SizedBox(width: 10),
              Text(AppStrings.moreLoad.tr())
            ],
          );
        } else if (mode == LoadStatus.failed) {
          body = const SizedBox();
        } else if (mode == LoadStatus.canLoading) {
          body = const SizedBox();
        } else {
          body = const SizedBox();
        }
        return SizedBox(
          height: 55.0,
          child: Center(child: body),
        );
      },
    ),
    enablePullDown: onRefresh == null ? false : true,
    primary: false,
    enablePullUp: enablePullUp,
    controller: controller,
    child: child ??
        ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: children ?? [],
        ),
  );
}
