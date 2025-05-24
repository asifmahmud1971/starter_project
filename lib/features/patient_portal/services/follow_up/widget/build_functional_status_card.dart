import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/cubit/followup_cubit.dart';

import 'build_smart_dropdown_widget.dart';
class BuildFunctionalStatusCard extends StatefulWidget {
  final String? functionalStatus;
  final String? painStatus;
  final Function(String?)? onChange;

  const BuildFunctionalStatusCard({super.key, this.functionalStatus, this.onChange, this.painStatus});

  @override
  State<BuildFunctionalStatusCard> createState() => _BuildFunctionalStatusCardState();
}

class _BuildFunctionalStatusCardState extends State<BuildFunctionalStatusCard> {
  final FollowUpCubit followUpCubit = GetContext.context.read<FollowUpCubit>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,
          boxShadow: [AppColors.kBackGroundShadow],borderRadius: BorderRadius.circular(8.r)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BuildSmartDropdown(
              value: followUpCubit.functionalStatus,
              hint: 'Select Functional Status',
              items: followUpCubit.functionalList,
              icon: Icons.directions_walk,
              onChanged:  (value) => setState(() {
                followUpCubit.functionalStatus = value;
              }),
            ),
            10.verticalSpace,
            BuildSmartDropdown(
              value: followUpCubit.pain,
              hint: 'Select Pain',
              items: followUpCubit.painList,
              icon: Icons.air,
              onChanged:  (value) => setState(() {
                followUpCubit.pain = value;
              }),
            )
          ],
        ),
      ),
    );
  }
}
