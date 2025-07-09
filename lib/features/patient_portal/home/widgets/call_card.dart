import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/chat/view/chat_screen.dart';

class AIChatCard extends StatelessWidget {
  const AIChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Talk to Our AI Assistant",
            style: kTitleMedium,
          ),
          12.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
              boxShadow: [AppColors.backgroundShadow],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Need instant answers?",
                        style: kTitleMedium,
                      ),
                      5.verticalSpace,
                      Text(
                        "Ask our AI assistant anytime",
                        style: kBodyMedium,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){GetContext.to(PalliativeChatScreen());},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.smart_toy, color: Colors.white, size: 20.r),
                        SizedBox(width: 6.w),
                        Text(
                          "Ask Now",
                          style: kTitleLarge.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
