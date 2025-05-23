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
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  // Controllers
  final FollowUpCubit followUpCubit = GetContext.context.read<FollowUpCubit>();

  // Dropdown values
  String? _shortnessOfBreath;
  String? _bowelMovement;
  String? _functionalStatus;

  // Physical symptoms
  final Map<String, bool> _physicalSymptoms = {
    'Pain': false,
    'Nausea': false,
    'Breathlessness': false,
    'Constipation': false,
    'Restlessness': false,
    'Drowsiness': false,
    'Dyspepsia': false,
    'Cough': false,
    'Swelling': false,
    'Fever': false,
    'Urinary Problem': false,
    'Vomiting': false,
    'Lymphedema': false,
    'Bedstore': false,
    'Poor Appetite': false,
    'Sleep disturbance': false,
    'No Complain': false,
    'Others': false,
  };

  // Color indicators based on values


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
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Time Card
              BuildDateTimeCard(
                 selectedDate: _selectedDate,
                 selectedTime: _selectedTime,
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
                functionalStatus: _functionalStatus,
                onChange: (value) => setState(() {
                  _functionalStatus = value;
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

  /*Widget _buildDateTimeCard() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, boxShadow: [AppColors.kBackGroundShadow]),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
             Icon(Icons.calendar_today, color: AppColors.kPrimaryColor),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Date & Time',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      )),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          icon:  Icon(Icons.calendar_month, size: 18,color: AppColors.kPrimaryColor.withValues(alpha: 0.8
                          ),),
                          label: Text(
                            DateFormat('MMM dd, yyyy').format(_selectedDate),
                          ),
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.kPrimaryColor.withValues(alpha: 0.2
                            ),
                            foregroundColor: AppColors.kPrimaryColor.withValues(alpha: 0.8
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () => _selectDate(context),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton.icon(
                          icon: const Icon(Icons.access_time, size: 18),
                          label: Text(_selectedTime.format(context)),
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.kPrimaryColor.withValues(alpha: 0.2
                            ),
                            foregroundColor: AppColors.kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () => _selectTime(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }*/

/*  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.kPrimaryColor),
          8.horizontalSpace,
          Text(title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.kPrimaryColor,
              )),
        ],
      ),
    );
  }*/

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
              ),
              secondField: CustomTextField(
                controller: followUpCubit.bpLowController,
                radius: 8.r,
                hint: "Low",
              ),
            ),
            Divider(height: 24.h, thickness: 0.5,color: AppColors.kGrayColor200,),
            BuildSmartVitalRow(
              label: 'Pulse (bpm) / Saturation (%)',
              firstField: CustomTextField(
                controller: followUpCubit.pulseController,
                radius: 8.r,
                hint: "Pulse",
              ),
              secondField: CustomTextField(
                controller: followUpCubit.saturationController,
                radius: 8.r,
                hint: "Saturation",
              ),
            ),
            Divider(height: 24.h, thickness: 0.5,color: AppColors.kGrayColor200,),
            BuildSmartVitalRow(
              label: 'Oxygen (L) / Temp (°F)',
              firstField: CustomTextField(
                controller: followUpCubit.oxygenController,
                radius: 8.r,
                hint: "Oxygen",
              ),
              secondField: CustomTextField(
                controller: followUpCubit.tempController,
                radius: 8.r,
                hint: "Temp",
              ),
            ),
            Divider(height: 24.h, thickness: 0.5,color: AppColors.kGrayColor200,),
            BuildSmartVitalRow(
              label: 'Intake (ml) / Output (ml)',
              firstField: CustomTextField(
                controller: followUpCubit.intakeController,
                radius: 8.r,
                hint: "Intake",
              ),
              secondField: CustomTextField(
                controller: followUpCubit.outputController,
                radius: 8.r,
                hint: "Output",
              ),
            ),
            Divider(height: 24.h, thickness: 0.5,color: AppColors.kGrayColor200,),
            BuildSmartVitalRow(
              label: 'Insulin (units) / Blood Sugar (mmol/L)',

              firstField: CustomTextField(
                controller: followUpCubit.insulinController,
                radius: 8.r,
                hint: "Insulin",
              ),
              secondField: CustomTextField(
                controller: followUpCubit.bloodSugarController,
                radius: 8.r,
                hint: "Blood Sugar",
              ),
            ),
            Divider(height: 24.h, thickness: 0.5,color: AppColors.kGrayColor200,),
            BuildSmartDropdown(
              value: _shortnessOfBreath,
              hint: 'Shortness of Breath',
              items: ['None', 'Mild', 'Moderate', 'Severe'],
              icon: Icons.air,
              onChanged:  (value) => setState(() {
                  _shortnessOfBreath = value;
              }),
            ),
            10.verticalSpace,
            BuildSmartDropdown(
              value: _bowelMovement,
              hint: 'Bowel Movement',
              items: ['Normal', 'Constipated', 'Diarrhea', 'Irregular'],
              icon: Icons.clean_hands,
              onChanged:  (value) => setState(() {
                  _bowelMovement = value;
              }),
            )
          ],
        ),
      ),
    );
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
              children: _physicalSymptoms.keys.map((symptom) {
                return ChoiceChip(
                  label: Text(symptom),
                  selected: _physicalSymptoms[symptom]!,
                  onSelected: (selected) {
                    setState(() {
                      _physicalSymptoms[symptom] = selected;
                      if (selected && symptom == 'No Complain') {
                        // If "No Complain" is selected, deselect all others
                        for (var key in _physicalSymptoms.keys) {
                          if (key != 'No Complain') {
                            _physicalSymptoms[key] = false;
                          }
                        }
                      } else if (selected && symptom != 'No Complain') {
                        // If any other symptom is selected, deselect "No Complain"
                        _physicalSymptoms['No Complain'] = false;
                      }
                    });
                  },
                  checkmarkColor: AppColors.kPrimaryColor,
                  selectedColor: AppColors.kPrimaryColor.withValues(alpha: 0.2),
                  backgroundColor: Colors.grey.shade100,
                  labelStyle: TextStyle(
                    color: _physicalSymptoms[symptom]!
                        ? AppColors.kPrimaryColor
                        : Colors.grey.shade800,
                    fontWeight: _physicalSymptoms[symptom]!
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: _physicalSymptoms[symptom]!
                          ? AppColors.kPrimaryColor
                          : Colors.grey.shade300,
                    ),
                  ),
                );
              }).toList(),
            ),
            if (_physicalSymptoms['Others']!)
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

/*  Widget _buildFunctionalStatusCard() {
    return Container(
      decoration: BoxDecoration(color: Colors.white,

      boxShadow: [AppColors.kBackGroundShadow],borderRadius: BorderRadius.circular(8.r)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BuildSmartDropdown(
          value: _functionalStatus,
          hint: 'Select Functional Status',
          items: [
            'Independent - No assistance needed',
            'Requires Assistance - Some help needed',
            'Dependent - Full assistance required',
            'Bedridden - Confined to bed',
            'Wheelchair-bound - Uses wheelchair'
          ],
          icon: Icons.directions_walk,
          onChanged: (value) => setState(() {
              _functionalStatus = value;
          }),
        ),
      ),
    );
  }*/

/*  Widget _buildSmartVitalRow({
    required String label,
    required Widget firstField,
    required Widget secondField,
    *//*required Color color,*//*
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            // Icon(Icons.circle, size: 12, color: color),
          ],
        ),
        8.verticalSpace,
        Row(
          children: [
            Expanded(child: firstField),
            const SizedBox(width: 16),
            Expanded(child: secondField),
          ],
        ),
      ],
    );
  }*/

/*  Widget _buildSmartNumberField(
    TextEditingController controller,
    String label,
    String hint,
   *//* Color? Function() getColor,*//*
  ) {
    return CustomTextField(
      radius: 8.r,
      borderThink: 0.5,
      hint: hint,
    );
  }*/
/*
  Widget _buildSmartDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required IconData icon,
  }) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            value: value,
            isExpanded: true,
            decoration: InputDecoration(
              labelText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey), // Default border color
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey), // Border color when not focused
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.kPrimaryColor), // Border color when focused
              ),
              prefixIcon: Icon(icon, color: AppColors.kPrimaryColor),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  maxLines: 1,
                ),
              );
            }).toList(),
            onChanged: (value) => setState(() {
              if (hint.contains('Shortness')) {
                _shortnessOfBreath = value;
              } else if (hint.contains('Bowel')) {
                _bowelMovement = value;
              } else {
                _functionalStatus = value;
              }
            }),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an option';
              }
              return null;
            },
            style: TextStyle(color: Colors.grey.shade800),
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            icon: Icon(Icons.arrow_drop_down, color: AppColors.kPrimaryColor),
            elevation: 2,
          ),
        ),
      ],
    );
  }*/

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
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
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
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
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
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

  void _saveFollowUp() {
    if (_formKey.currentState!.validate()) {
      // Process and save the data
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Follow-up record saved successfully.'),
            actions: [
              TextButton(
                onPressed: () {
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

  @override
  void dispose() {
    followUpCubit.bpHighController.dispose();
    followUpCubit.bpLowController.dispose();
    followUpCubit.pulseController.dispose();
    followUpCubit.saturationController.dispose();
    followUpCubit.oxygenController.dispose();
    followUpCubit.tempController.dispose();
    followUpCubit.intakeController.dispose();
    followUpCubit.outputController.dispose();
    followUpCubit.insulinController.dispose();
    followUpCubit.bloodSugarController.dispose();
    super.dispose();
  }
}
