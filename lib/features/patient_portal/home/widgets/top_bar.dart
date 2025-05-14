import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_image.dart';
import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/profile/profile_screen.dart';
import 'package:medPilot/generated/assets.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap:() {GetContext.to(PatientProfileScreen());},
              child: Row(
                children: [
                  CustomImage(
                    baseUrl:
                        "https://images.unsplash.com/photo-1633332755192-727a05c4013d?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
                    isCircle: true,
                    size: 45.r,
                  ),
                  10.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: kBodyLarge,
                      ),
                      Text(
                        "Asif Al Mahmud",
                        style: kTitleMedium,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              CustomSvg(icon: Assets.iconsNotification),
            ],
          )
        ],
      ),
    );
  }
}
