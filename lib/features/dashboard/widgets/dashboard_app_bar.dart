import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/core/router/routes.dart';
import 'package:medPilot/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool centerTitle;
  final bool isAction;
  final double leadingWidth;
  final double elevation;
  final double titleSpacing;
  final String? icon;
  final Color? shadowColor;
  final Color? backgroundColor;
  final VoidCallback? onBackPress;
  final List<Widget>? actions;

  const DashboardAppBar(
      {super.key,
      this.title,
      this.centerTitle = false,
      this.isAction = false,
      this.leadingWidth = 50,
      this.elevation = 0,
      this.titleSpacing = 0,
      this.icon,
      this.shadowColor,
      this.backgroundColor,
      this.onBackPress,
      this.actions});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.h),
      child: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: centerTitle,
        leadingWidth: leadingWidth.w,
        backgroundColor: backgroundColor ?? AppColors.kWhiteColor,
        elevation: elevation,
        titleSpacing: titleSpacing,
        shadowColor: shadowColor ?? AppColors.kGrayColor100,
        title: title != null
            ? Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: kOtherLargeProminent,
              )
            : Row(
                children: [
                  SizedBox(width: 5.w),
                  Image.asset(
                    Assets.iconsAlbanian,
                    height: 35.h,
                  )
                ],
              ),
        actions: actions ??
            [
              InkWell(
                onTap: () {},
                radius: 30.r,
                borderRadius: BorderRadius.circular(30.r),
                splashColor: AppColors.kBorderOrangeColor.withOpacity(0.2),
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: const CustomSvg(
                    icon: Assets.iconsHome,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  GetContext.toNamed(route: Routes.cartScreen);
                },
                radius: 30.r,
                borderRadius: BorderRadius.circular(30.r),
                splashColor: AppColors.kBorderOrangeColor.withOpacity(0.2),
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: const CustomSvg(
                    icon: Assets.iconsHome,
                  ),
                ),
              ),
              SizedBox(width: 10.w)
            ],
      ),
    );
  }
}
