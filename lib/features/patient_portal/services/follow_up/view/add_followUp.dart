import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_text_field.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/cubit/followup_cubit.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/widget/build_date_time_card.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/widget/build_functional_status_card.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/widget/build_smart_vital_row.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/widget/build_head_section_widget.dart';
import '../widget/build_smart_dropdown_widget.dart';

class AddFollowUpScreen extends StatefulWidget {
  const AddFollowUpScreen({super.key});

  @override
  State<AddFollowUpScreen> createState() => _AddFollowUpScreenState();
}

class _AddFollowUpScreenState extends State<AddFollowUpScreen> {
  final FollowUpCubit followUpCubit = GetContext.context.read<FollowUpCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Patient Follow-Up',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.kPrimaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: _showHelpDialog,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: followUpCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Time Card
              BuildDateTimeCard(
                 selectedDate: followUpCubit.selectedDate,
                 selectedTime: followUpCubit.selectedTime,
                onSelectDate: () => _selectDate(context),
                onSelectTime: ()=> _selectTime(context),
              ),
              20.verticalSpace,
              BuildHeadSectionWidget(title: AppStrings.vitalSign.tr(),icon: Icons.monitor_heart),
              _buildVitalSignsCard(),
              20.verticalSpace,
              BuildHeadSectionWidget(title:AppStrings.physicalSymptoms.tr(), icon: Icons.medical_services),
              _buildPhysicalSymptomsCard(),
              20.verticalSpace,
              BuildHeadSectionWidget(title: 'Functional Status', icon: Icons.accessibility),
              BuildFunctionalStatusCard(
                functionalStatus: followUpCubit.functionalStatus,
                onChange: (value) => setState(() {
                  followUpCubit.functionalStatus = value;
                }),
              ),
              30.verticalSpace,
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save, size: 20),
                  label: const Text('SAVE FOLLOW-UP',
                      style: TextStyle(letterSpacing: 1)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: AppColors.kPrimaryColor.withValues(alpha: 0.7
                    ),
                    foregroundColor: Colors.white,
                    elevation: 4,
                  ),
                  onPressed: _saveFollowUp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Function validation = (value) =>
  value.isEmpty ? 'This field is required' : null;

  Widget _buildVitalSignsCard() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, boxShadow: [AppColors.kBackGroundShadow]),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BuildSmartVitalRow(
              label: 'Blood Pressure (mmHg)',
              firstField: CustomTextField(
                controller: followUpCubit.bpHighController,
                radius: 8.r,
                hint: "hint",
                validation: validation,
              ),
              secondField: CustomTextField(
                controller: followUpCubit.bpLowController,
                radius: 8.r,
                hint: "Low",
                validation: validation,
              ),
            ),
            Divider(height: 24.h, thickness: 0.5,color: AppColors.kGrayColor200,),
            BuildSmartVitalRow(
              label: 'Pulse (bpm) / Saturation (%)',
              firstField: CustomTextField(
                controller: followUpCubit.pulseController,
                radius: 8.r,
                hint: "Pulse",
                validation: validation,
              ),
              secondField: CustomTextField(
                controller: followUpCubit.saturationController,
                radius: 8.r,
                hint: "Saturation",
                validation: validation,
              ),
            ),
            Divider(height: 24.h, thickness: 0.5,color: AppColors.kGrayColor200,),
            BuildSmartVitalRow(
              label: 'Oxygen (L) / Temp (°F)',
              firstField: CustomTextField(
                controller: followUpCubit.oxygenController,
                radius: 8.r,
                hint: "Oxygen",
                validation: validation,
              ),
              secondField: CustomTextField(
                controller: followUpCubit.tempController,
                radius: 8.r,
                hint: "Temp",
                validation: validation,
              ),
            ),
            Divider(height: 24.h, thickness: 0.5,color: AppColors.kGrayColor200,),
            BuildSmartVitalRow(
              label: 'Intake (ml) / Output (ml)',
              firstField: CustomTextField(
                controller: followUpCubit.intakeController,
                radius: 8.r,
                hint: "Intake",
                validation: validation,
              ),
              secondField: CustomTextField(
                controller: followUpCubit.outputController,
                radius: 8.r,
                hint: "Output",
                validation: validation,
              ),
            ),
            Divider(height: 24.h, thickness: 0.5,color: AppColors.kGrayColor200,),
            BuildSmartVitalRow(
              label: 'Insulin (units) / Blood Sugar (mmol/L)',

              firstField: CustomTextField(
                controller: followUpCubit.insulinController,
                radius: 8.r,
                hint: "Insulin",
                validation: validation,
              ),
              secondField: CustomTextField(
                controller: followUpCubit.bloodSugarController,
                radius: 8.r,
                hint: "Blood Sugar",
                validation: validation,
              ),
            ),
            Divider(height: 24.h, thickness: 0.5,color: AppColors.kGrayColor200,),
            BuildSmartDropdown(
              value: followUpCubit.shortnessOfBreath,
              hint: 'Shortness of Breath',
              items: ['None', 'Mild', 'Moderate', 'Severe'],
              icon: Icons.air,
              onChanged:  (value) => setState(() {
                followUpCubit.shortnessOfBreath = value;
              }),
            ),
            10.verticalSpace,
            BuildSmartDropdown(
              value: followUpCubit.bowelMovement,
              hint: 'Bowel Movement',
              items: ['Normal', 'Constipated', 'Diarrhea', 'Irregular'],
              icon: Icons.clean_hands,
              onChanged:  (value) => setState(() {
                followUpCubit.bowelMovement = value;
              }),
            )
          ],
        ),
      ),
    );
  }

  void _saveFollowUp() {
    if (followUpCubit.formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Follow-up record saved successfully.'),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<FollowUpCubit>().createFollowUp();
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Return to previous screen
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  Widget _buildPhysicalSymptomsCard() {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [AppColors.kBackGroundShadow],
          borderRadius: BorderRadius.circular(8.r)),
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
                        // If "No Complain" is selected, deselect all others
                        for (var key in followUpCubit.physicalSymptoms.keys) {
                          if (key != 'No Complain') {
                            followUpCubit.physicalSymptoms[key] = false;
                          }
                        }
                      } else if (selected && symptom != 'No Complain') {
                        // If any other symptom is selected, deselect "No Complain"
                        followUpCubit.physicalSymptoms['No Complain'] = false;
                      }
                    });
                  },
                  checkmarkColor: AppColors.kPrimaryColor,
                  selectedColor: AppColors.kPrimaryColor.withValues(alpha: 0.2),
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
            if (followUpCubit.physicalSymptoms['Others']!)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Specify other symptoms',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: followUpCubit.selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.kPrimaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.grey.shade800,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != followUpCubit.selectedDate) {
      setState(() {
        followUpCubit.selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: followUpCubit.selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.kPrimaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.grey.shade800,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != followUpCubit.selectedTime) {
      setState(() {
        followUpCubit.selectedTime = picked;
      });
    }
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Help'),
          content: const Text(
            'Fill in all the patient\'s vital signs and symptoms. '
            'The color indicators show whether values are normal (green), '
            'concerning (orange), or critical (red).',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }


}
