import 'package:flutter/material.dart';
import 'package:medPilot/core/constants/app_colors.dart';

class MedPilotAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(96); // 56 (default) + 40 (bottom)

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor.withOpacity(0.15),
      elevation: 0,
      titleSpacing: 5.0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: AppColors.kPrimaryColor),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.kPrimaryColor.withOpacity(0.2),
            child: const Icon(Icons.medical_services, color: AppColors.kPrimaryColor),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "MedPilot AI",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "Your Medical Assistant",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Available 24/7 • Knowledgeable • Compassionate",
            style: TextStyle(
              color: AppColors.kPrimaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}