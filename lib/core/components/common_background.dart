import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_colors.dart';

class CommonBackground extends StatelessWidget {
  final Widget? child;
  const CommonBackground({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        gradient: AppColors.backGroundColor,
      ),
      child: child,
    );
  }
}
