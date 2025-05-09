import 'package:demo/core/constants/app_colors.dart';
import 'package:demo/features/screens/auth/sign_up/models/tutorial_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientFAB extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const GradientFAB({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sessionTutorialKey,
      width: .2.sw,
      height: .06.sh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0).r,
        gradient: AppColors.kGenderButtonGradient,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: onPressed,
        elevation: 0,
        backgroundColor: Colors.transparent,
        // Make the FAB background transparent
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
