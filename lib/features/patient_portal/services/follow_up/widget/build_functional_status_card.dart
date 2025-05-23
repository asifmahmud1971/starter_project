import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_colors.dart';

import 'build_smart_dropdown_widget.dart';

class BuildFunctionalStatusCard extends StatelessWidget {
  final String? functionalStatus;
  final Function(String?)? onChange;

  const BuildFunctionalStatusCard({super.key, this.functionalStatus, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,

          boxShadow: [AppColors.kBackGroundShadow],borderRadius: BorderRadius.circular(8.r)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BuildSmartDropdown(
          value: functionalStatus,
          hint: 'Select Functional Status',
          items: [
            'Independent - No assistance needed',
            'Requires Assistance - Some help needed',
            'Dependent - Full assistance required',
            'Bedridden - Confined to bed',
            'Wheelchair-bound - Uses wheelchair'
          ],
          icon: Icons.directions_walk,
          onChanged: onChange
        ),
      ),
    );
  }
}
