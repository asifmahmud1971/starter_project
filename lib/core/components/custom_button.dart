import 'package:demo/core/components/custom_svg.dart';
import 'package:demo/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Gradient? gradient;
  final bool isGradientColor;
  final bool isBorder;
  final Border? border;
  final Color borderColor;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool isPrefixEnable;
  final String? icon;
  final double? iconSize;
  final double? borderRadius;
  final Color? iconColor;

  const CustomButton({
    super.key,
    this.title,
    this.gradient,
    this.isGradientColor = true,
    this.isBorder = false,
    this.border,
    this.borderColor = AppColors.kGrayColor300,
    this.borderRadius,
    this.onTap,
    this.textStyle,
    this.textColor,
    this.backgroundColor,
    this.padding,
    this.isPrefixEnable = false,
    this.icon,
    this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30.r),
      // Same border radius as Container
      child: Container(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 20.r,
              vertical: 15.r,
            ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.kGrayColor900,
            gradient: isGradientColor
                ? gradient ??
                    (onTap != null
                        ? AppColors.kButtonGradient
                        : LinearGradient(
                            colors: [
                              const Color(0xFF4E54CB).withOpacity(0.2),
                              const Color(0xFF17A0B2).withOpacity(0.186),
                            ], // Blue and purple gradient
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ))
                : null, // Apply the gradient
            borderRadius: BorderRadius.circular(borderRadius ?? 100.r),
            border: isBorder
                ? border ?? Border.all(color: borderColor, width: 1)
                : null // Rounded corners
            ),
        child: isPrefixEnable
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSvg(
                    icon: icon!,
                    size: iconSize ?? 24.r,
                    color: iconColor,
                  ),
                  10.horizontalSpace,
                  Text(
                    title ?? "",
                    style: textStyle ??
                        kTitleMedium.copyWith(
                            color: textColor ?? AppColors.kWhiteColor),
                  )
                ],
              )
            : Text(
                title ?? "",
                style: textStyle ??
                    kTitleMedium.copyWith(
                        color: textColor ?? AppColors.kWhiteColor),
              ),
      ),
    );
  }
}

/*@deprecated
class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPress;
  final bool isCenter;
  final double radius;
  final double border;
  final double elevation;
  final Color borderColor;
  final Color splashColor;
  final Color textColor;
  final Color? iconColor;
  final Color btnColor;
  final TextStyle? textStyle;
  final double? padding;
  final EdgeInsets? edgeInsets;
  final Widget? iconGap;
  final bool outlineButton;
  final bool isIconEnable;
  final bool isIconLeft;
  final String? icon;
  final double? iconSize;

  const CustomButton({
    super.key,
    this.title,
    this.textColor = Colors.white,
    this.btnColor = AppColors.kPrimarySpeechBlue500,
    this.borderColor = AppColors.kPrimarySpeechBlue500,
    this.splashColor = AppColors.kPrimarySpeechBlue600,
    this.border = 0,
    this.elevation = 0,
    this.onPress,
    this.textStyle,
    this.edgeInsets,
    this.outlineButton = false,
    this.isCenter = true,
    this.isIconEnable = false,
    this.isIconLeft = false,
    this.icon,
    this.radius = 30.0,
    this.padding,
    this.iconSize,
    this.iconColor,
    this.iconGap,
  });

  @override
  Widget build(BuildContext context) {
    return isIconEnable
        ? TextButton(
            onPressed: onPress,
            style: ButtonStyle(
              overlayColor:
                  WidgetStateColor.resolveWith((states) => splashColor),
              padding: WidgetStateProperty.all(
                  edgeInsets ?? REdgeInsets.all(padding ?? 16)),
              backgroundColor: WidgetStateProperty.all(btnColor),
              elevation: WidgetStateProperty.all(elevation),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius).r,
                  side: BorderSide(
                    width: outlineButton ? 1 : border,
                    color: outlineButton
                        ? borderColor
                        : border == 0
                            ? Colors.transparent
                            : borderColor,
                  ),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment:
                  isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                isIconLeft
                    ? const SizedBox.shrink()
                    : isSvgImage(icon ?? "")
                        ? CustomSvg(
                            icon: icon!,
                            size: iconSize ?? 24.r,
                            color: iconColor,
                          )
                        : Image.asset(
                            icon ?? "",
                            height: iconSize ?? 24.r,
                            width: iconSize ?? 24.r,
                          ),
                isIconLeft
                    ? const SizedBox.shrink()
                    : iconGap ?? 5.horizontalSpace,
                Text(
                  title ?? "",
                  textAlign: TextAlign.center,
                  style: textStyle ??
                      kButtonLargeStyle.copyWith(
                        color: outlineButton ? textColor : textColor,
                        fontWeight: boldFont,
                      ),
                ),
                isIconLeft
                    ? iconGap ?? 5.horizontalSpace
                    : const SizedBox.shrink(),
                isIconLeft
                    ? isSvgImage(icon ?? "")
                        ? CustomSvg(
                            icon: icon!,
                            size: iconSize ?? 24.r,
                            color: iconColor,
                          )
                        : Image.asset(
                            icon ?? "",
                            height: iconSize ?? 24.r,
                            width: iconSize ?? 24.r,
                          )
                    : const SizedBox.shrink(),
              ],
            ),
          )
        : TextButton(
            onPressed: onPress,
            style: ButtonStyle(
              overlayColor:
                  WidgetStateColor.resolveWith((states) => splashColor),
              padding: WidgetStateProperty.all(
                  edgeInsets ?? REdgeInsets.all(padding ?? 16)),
              backgroundColor: WidgetStateProperty.all(btnColor),
              elevation: WidgetStateProperty.all(elevation),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: BorderSide(
                    width: outlineButton ? 1 : border,
                    color: outlineButton
                        ? borderColor
                        : border == 0
                            ? Colors.transparent
                            : borderColor,
                  ),
                ),
              ),
            ),
            child: Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: textStyle ??
                  kButtonLargeStyle.copyWith(
                    color: outlineButton ? textColor : textColor,
                    fontWeight: boldFont,
                  ),
            ),
          );
  }

  bool isSvgImage(String imagePath) {
    return imagePath.toLowerCase().endsWith(".svg");
  }
}*/

@deprecated
class CustomCirclesButton extends StatelessWidget {
  final Function()? onTap;
  final String? icon;
  final double? iconSize;
  final double? padding;
  final Color? iconColors;
  final Color? backGroundColor;

  const CustomCirclesButton(
      {super.key,
      this.onTap,
      this.icon,
      this.iconColors,
      this.backGroundColor,
      this.iconSize,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: 30.r,
      borderRadius: BorderRadius.circular(30.r),
      splashColor: AppColors.kBorderOrangeColor.withOpacity(0.2),
      child: Card(
        elevation: 0,
        shadowColor: AppColors.kShadowColor.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        color: backGroundColor ?? AppColors.kButtonPrimaryColor,
        child: Padding(
          padding: EdgeInsets.all(padding ?? 5.r),
          child: CustomSvg(
            icon: icon ?? Assets.imagesPlaceholder,
            size: iconSize ?? 16.r,
            color: iconColors ?? AppColors.kWhiteColor,
          ),
        ),
      ),
    );
  }
}
