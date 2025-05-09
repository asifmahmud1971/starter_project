import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_style.dart';

class HintText extends StatelessWidget {
  const HintText({
    super.key,
    this.prefixText,
    this.suffixText,
    this.tap,
    this.prefixTextStyle,
    this.suffixTextStyle,
  });

  final String? prefixText;
  final TextStyle? prefixTextStyle;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final VoidCallback? tap;

  @override
  Widget build(BuildContext context) {
    final prefixTs = prefixTextStyle ??
        kLabelLarge.copyWith(color: AppColors.neutralGray600);

    final suffixTs = suffixTextStyle ??
        kBodyMedium.copyWith(color: AppColors.kPrimarySpeechBlue);

    return RichText(
      text: TextSpan(
        children: [
          if (prefixText != null) TextSpan(text: prefixText, style: prefixTs),
          if (suffixText != null)
            TextSpan(
              text: suffixText,
              style: suffixTs,
              recognizer: TapGestureRecognizer()..onTap = tap,
            ),
        ],
      ),
    );
  }
}
