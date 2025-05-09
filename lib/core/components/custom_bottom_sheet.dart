import 'package:demo/core/components/custom_svg.dart';
import 'package:demo/core/components/custom_text_field.dart';
import 'package:demo/core/constants/app_strings.dart';
import 'package:demo/core/constants/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app/app_context.dart';
import '../../core/constants/app_colors.dart';
import '../../generated/assets.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget child;
  final Color? color;

  const CustomBottomSheet({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: color,
          borderRadius: color != null
              ? const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                )
              : null),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).copyWith().size.height -
            (MediaQueryData.fromView(View.of(context)).padding.top + 50),
      ),
      child: child,
    );
  }
}

void showCustomBottomSheet(
    {Widget? contents,
    bool? isSearchEnable,
    TextEditingController? controller,
    Widget? bottomContents,
    Function(String)? onChange,
    String? title}) {
  showModalBottomSheet(
    isDismissible: true,
    enableDrag: true,
    constraints: BoxConstraints(maxHeight: .9.sh),
    isScrollControlled: true,
    context: GetContext.context,
    backgroundColor: AppColors.kWhiteColor,
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ).r,
    ),
    builder: (BuildContext sheetContext) {
      return Container(
        // Fixed height (75% of the screen height)
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 5,
                width: 40,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            20.verticalSpace,
            Text(
              title ?? "",
              style: kTitleLarge.copyWith(color: AppColors.kGrayColor900),
            ),
            24.verticalSpace,
            isSearchEnable ?? false
                ? CustomTextField(
                    controller: controller,
                    height: 4,
                    hint: AppStrings.searchInputText.tr(),
                    borderThink: 1,
                    hintStyle:
                        kBodyMedium.copyWith(color: AppColors.kGrayColor500),
                    isEmail: true,
                    isDense: true,
                    hintColor: AppColors.kGrayColor,
                    textColor: AppColors.kTextPrimaryColor,
                    borderColor: AppColors.kGrayColor100,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 6.w,
                      ),
                      child: const CustomSvg(
                        icon: Assets.iconsSearch4,
                        size: 20,
                      ),
                    ),
                    // focusNode: emailFocus,
                    onChanged: (val) {
                      onChange!(val);
                    },
                    validation: (value) {},
                    fillColor: AppColors.kWhiteColor,
                  )
                : Container(),
            const SizedBox(height: 10),
            Expanded(
              child: Scrollbar(child: contents ?? Container()),
            ),
            bottomContents ?? Container()
          ],
        ),
      );
    },
  );
}
