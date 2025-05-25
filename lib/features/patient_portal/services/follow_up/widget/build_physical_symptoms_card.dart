import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/cubit/followup_cubit.dart';
import '../../../../../core/app/app_context.dart';

class BuildPhysicalSymptomsCard extends StatefulWidget {
  const BuildPhysicalSymptomsCard({super.key});

  @override
  State<BuildPhysicalSymptomsCard> createState() => _BuildPhysicalSymptomsCardState();
}

class _BuildPhysicalSymptomsCardState extends State<BuildPhysicalSymptomsCard> {
  final followUpCubit = GetContext.context.read<FollowUpCubit>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [AppColors.kBackGroundShadow],
          borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: followUpCubit.physicalSymptoms.keys.map((symptom) {
                return ChoiceChip(
                  label: Text(symptom),
                  selected: followUpCubit.physicalSymptoms[symptom]!,
                  onSelected: (selected) {
                    setState(() {
                      followUpCubit.physicalSymptoms[symptom] = selected;
                      if (selected && symptom == 'No Complain') {
                        for (var key in followUpCubit.physicalSymptoms
                            .keys) {
                          if (key != 'No Complain') {
                            followUpCubit.physicalSymptoms[key] = false;
                          }
                        }
                      } else if (selected && symptom != 'No Complain') {
                        followUpCubit.physicalSymptoms['No Complain'] =
                        false;
                      }
                    });
                  },
                  checkmarkColor: AppColors.kPrimaryColor,
                  selectedColor: AppColors.kPrimaryColor.withValues(
                      alpha: 0.2),
                  backgroundColor: Colors.grey.shade100,
                  labelStyle: TextStyle(
                    color: followUpCubit.physicalSymptoms[symptom]!
                        ? AppColors.kPrimaryColor
                        : Colors.grey.shade800,
                    fontWeight: followUpCubit.physicalSymptoms[symptom]!
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: followUpCubit.physicalSymptoms[symptom]!
                          ? AppColors.kPrimaryColor
                          : Colors.grey.shade300,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
