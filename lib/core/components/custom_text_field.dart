import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_style.dart';
import '../../generated/assets.dart';
import 'custom_svg.dart';

class CustomTextField extends StatefulWidget {
  final String? title;
  final String? hint;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onPress;
  final VoidCallback? fieldClick;
  final ValueChanged<String>? onChanged;

  // final InputDecoration? decoration = const InputDecoration();
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? textColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? borderColor;
  final Function? validation;
  final TextInputType? keyboardType;
  final String? errorText;
  final double? prefixIconSize;
  final double? suffixIconSizeWidth;
  final double? suffixIconSizeHeight;
  final double? errorTextHeight;
  final double? hintTextSize;
  final double? height;
  final double? width;
  final double? radius;
  final Function(String)? onSaved;
  final bool? isEmail;
  final bool isPassword;
  final bool isSecure;
  final bool readOnly;
  final bool isDense;
  final double? borderThink;
  final TextInputAction? textInputAction;
  final TextStyle? errorStyle;
  final Color? underLineBorderColor;
  final FocusNode? focusNode;
  final bool isError;
  final bool isOptional;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;
  final TapRegionCallback? onTapOutside;

  const CustomTextField(
      {super.key,
      this.title,
      this.hint,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.onPress,
      this.errorText,
      this.prefixIconColor,
      this.suffixIconColor,
      this.fillColor,
      this.hintColor,
      this.onSaved,
      this.keyboardType,
      this.isEmail,
      this.borderThink,
      this.validation,
      this.prefixIconSize,
      this.suffixIconSizeWidth,
      this.suffixIconSizeHeight,
      this.onChanged,
      this.errorTextHeight,
      this.textColor,
      this.hintTextSize,
      this.height,
      this.width,
      this.radius,
      this.fieldClick,
      this.borderColor,
      this.isPassword = false,
      this.isSecure = false,
      this.readOnly = false,
      this.isDense = false,
      this.textInputAction = TextInputAction.next,
      this.errorStyle,
      this.underLineBorderColor,
      this.focusNode,
      this.isError = false,
      this.isOptional = true,
      this.hintStyle,
      this.titleStyle,
      this.onTapOutside, this.labelText, this.labelStyle});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isVisible;

  @override
  void initState() {
    isVisible = widget.isSecure;
    super.initState();
  }

  void _toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.title != null ? true : false,
          child: Row(
            children: [
              Flexible(
                child: Text(
                  widget.title ?? "",
                  style: widget.titleStyle ??
                      kBodyMedium.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              widget.isOptional
                  ? Transform.translate(
                      offset: const Offset(2, -2),
                      child: /*SvgPicture.asset(
                        Assets.iconsStar,
                        width: 8.r,
                        height: 8.r,
                      )*/
                          Text(
                        "*",
                        style: kLabelExtraLargeProminent,
                      ))
                  : const SizedBox.shrink()
            ],
          ),
        ),
        Visibility(
            visible: widget.title != null ? true : false,
            child: SizedBox(height: 8.h)),
        TextFormField(
          readOnly: widget.readOnly,
          textAlign: TextAlign.start,
          obscureText: isVisible,
          cursorColor: AppColors.kTextPrimaryColor,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscuringCharacter: "*",
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          // maxLength: 3,
          style: kBodyLarge.copyWith(
            color: widget.textColor ?? AppColors.kGrayColor,
            decoration: TextDecoration.none,
            decorationThickness: 0,
          ),
          onTap: widget.fieldClick ?? () {},
          inputFormatters: [
            if (widget.keyboardType == TextInputType.number) ...[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d{0,6})?$')),
            ] else if (widget.keyboardType == TextInputType.text) ...[
              FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9 ]*")),
            ],
            // if (widget.keyboardType == TextInputType.name) ...[
            //   FilteringTextInputFormatter.deny(RegExp(r"[0-9]")),
            //   FilteringTextInputFormatter.deny(
            //     RegExp(r'[~!@#$%^&*()_+`{}|<>?;:.,=[\]\\/\-]'),
            //   ),
            // ]
          ],
          decoration: InputDecoration(
            errorMaxLines: 3,
            labelText: widget.labelText,
            labelStyle: widget.labelStyle,
            contentPadding: EdgeInsets.symmetric(
              vertical: widget.height ?? 17.h,
              horizontal: widget.width ?? 16.w,
            ),
            counter: const Offstage(),
            isDense: widget.isDense,
            prefixIconConstraints: BoxConstraints.tight(
              Size(
                widget.prefixIconSize ?? 45.r,
                widget.prefixIconSize ?? 45.r,
              ),
            ),
            suffixIconConstraints: BoxConstraints.tight(
              Size(
                widget.suffixIconSizeWidth ?? 45.r,
                widget.suffixIconSizeHeight ?? 45.r,
              ),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? RPadding(
                    padding: REdgeInsets.only(right: 18.w),
                    child: InkWell(
                      onTap: _toggleVisibility,
                      child: CustomSvg(
                        icon: isVisible
                            ? Assets.iconsViewOn
                            : Assets.iconsViewOff,
                        size: 16.r,
                        //color: AppColors.kMeatBrown500,
                      ),
                    ),
                  )
                : widget.suffixIcon == null
                    ? null
                    : InkWell(
                        onTap: widget.onPress,
                        child: widget.suffixIcon,
                      ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.isError
                      ? AppColors.kError600
                      : widget.borderColor ?? AppColors.kBorderColor,
                  width: 1.0),
              borderRadius: BorderRadius.circular(widget.radius ?? 30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.isError
                    ? AppColors.kError600
                    : widget.borderColor ?? AppColors.kPrimaryColor,
                width: widget.borderThink ?? 1.0,
              ),
              borderRadius: BorderRadius.circular(widget.radius ?? 30).r,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.isError
                    ? AppColors.kError600
                    : widget.borderColor ?? AppColors.kBorderColor,
                width: 5.0,
              ),
              borderRadius: BorderRadius.circular(widget.radius ?? 30).r,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.isError
                    ? AppColors.kError950
                    : widget.borderColor ?? AppColors.kBorderColor,
                width: widget.borderThink ?? 1.0,
              ),
              borderRadius: BorderRadius.circular(widget.radius ?? 30).r,
            ),
            filled: true,
            errorStyle: TextStyle(
              height: 0,
              fontWeight: regularFont,
              fontFamily: kHankenGroteskFamily,
            ),
            hintStyle: widget.hintStyle ??
                TextStyle(
                  fontSize: widget.hintTextSize ?? 16.sp,
                  color: widget.hintColor ?? AppColors.kTextHintColor,
                  fontWeight: FontWeight.w400,
                ),
            hintText: widget.hint ?? "",
            errorText: widget.errorText,
            fillColor: widget.fillColor ?? AppColors.kGrayColor50,
          ),
          validator: widget.validation as String? Function(String?)?,
          onSaved: widget.onSaved as String? Function(String?)?,
          onTapOutside: widget.onTapOutside,
        ),
      ],
    );
  }
}
