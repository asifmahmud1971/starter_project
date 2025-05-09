import 'package:demo/core/app/app_context.dart';
import 'package:demo/core/components/custom_svg.dart';
import 'package:demo/core/constants/app_colors.dart';
import 'package:demo/core/constants/app_text_style.dart';
import 'package:demo/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool centerTitle;
  final bool isActions;
  final bool isLogo;
  final bool isCart;
  final bool isCustomLeadingIcon;
  final Widget? customLeadingIcon;
  final bool isSearch;
  final double leadingWidth;
  final double elevation;
  final double titleSpacing;
  final String? icon;
  final Color? shadowColor;
  final Color? backgroundColor;
  final VoidCallback? onBackPress;
  final List<Widget>? actions;

  const CustomAppBar(
      {super.key,
      this.title,
      this.centerTitle = false,
      this.isActions = false,
      this.isCart = false,
      this.isCustomLeadingIcon = false,
      this.customLeadingIcon,
      this.isSearch = false,
      this.leadingWidth = 55,
      this.elevation = 0,
      this.titleSpacing = 0,
      this.icon,
      this.shadowColor,
      this.backgroundColor,
      this.onBackPress,
      this.actions,
      this.isLogo = false});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.h),
      child: AppBar(
        automaticallyImplyLeading: isLogo ? true : false,
        centerTitle: centerTitle,
        leadingWidth: leadingWidth.w,
        leading: isLogo
            ? null
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: InkWell(
                  onTap: onBackPress ??
                      () {
                        GetContext.back();
                      },
                  child: isCustomLeadingIcon
                      ? (customLeadingIcon ?? const SizedBox.shrink())
                      : RPadding(
                          padding: REdgeInsets.only(left: 20.w, right: 10.w),
                          child: CustomSvg(
                            icon: icon ?? Assets.iconsHome,
                            size: 24.r,
                          ),
                        ),
                ),
              ),
        backgroundColor: backgroundColor ?? AppColors.kWhiteColor,
        elevation: elevation,
        titleSpacing: titleSpacing,
        shadowColor: shadowColor ?? AppColors.kGrayColor100,
        title: isLogo
            ? Row(
                children: [
                  SizedBox(width: 5.w),
                  Image.asset(
                    Assets.iconsAlbanian,
                    height: 35.h,
                  )
                ],
              )
            : Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: kOtherLargeProminent,
              ),
      ),
    );
  }
}
