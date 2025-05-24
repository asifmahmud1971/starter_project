import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_text_field.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/cubit/painClinic_cubit.dart';

class AddPainAssessmentScreen extends StatefulWidget {
  @override
  _AddPainAssessmentScreenState createState() => _AddPainAssessmentScreenState();
}

class _AddPainAssessmentScreenState extends State<AddPainAssessmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final PainClinicCubit painClinicCubit = GetContext.context.read<PainClinicCubit>();

  final List<String> _timeOptions = [
    'Worsens in morning',
    'Worsens at night',
    'Constant throughout day',
    'Comes and goes',
    'After activity'
  ];

  final List<String> _reliefOptions = [
    'Rest',
    'Medication',
    'Heat therapy',
    'Ice pack',
    'Movement',
    'Massage'
  ];

  final List<String> _severityOptions = [
    'Mild',
    'Moderate',
    'Severe',
    'Excruciating'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text(AppStrings.newPainAssessment.tr(), style: kTitleMedium),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.recordYourPainDetails.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 24),

              // Location Input
              _buildSectionHeader('${AppStrings.location.tr()}:'),
              SizedBox(height: 8),
              CustomTextField(
                hint: "Where is the pain located?",
                borderColor: Colors.white,
                hintColor: AppColors.kTextPrimaryColor,
                radius: 12.r,
                fillColor: Colors.white,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter pain location';
                  }
                  return null;
                },
                onSaved: (value) => painClinicCubit.location = value,

              ),

              SizedBox(height: 20),

              // Change of Time Dropdown
              _buildSectionHeader('Change Of Time:'),
              SizedBox(height: 8),
              _buildDropdown(
                value: painClinicCubit.changeOfTime,
                hint: 'Select change of time',
                items: _timeOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select change of time';
                  }
                  return null;
                },
                onChanged: (value) => setState(() => painClinicCubit.changeOfTime = value),
              ),
              SizedBox(height: 20),

              // Radiation Input
              _buildSectionHeader('Radiation:'),
              SizedBox(height: 8),
              CustomTextField(
                hint: "Does the pain radiate anywhere?",
                borderColor: Colors.white,
                hintColor: AppColors.kTextPrimaryColor,
                radius: 12.r,
                fillColor: Colors.white,
                onSaved: (value) => painClinicCubit.radiation = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter radiation';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Relieving Factors Dropdown
              _buildSectionHeader('Relieving factors:'),
              SizedBox(height: 8),
              _buildDropdown(
                value: painClinicCubit.relievingFactors,
                hint: 'Select relieving factors',
                items: _reliefOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select relieving factors';
                  }
                  return null;
                },
                onChanged: (value) => setState(() => painClinicCubit.relievingFactors = value),
              ),
              SizedBox(height: 20),

              // Severity Dropdown
              _buildSectionHeader('Severity:'),
              SizedBox(height: 8),
              _buildDropdown(
                value: painClinicCubit.severity,
                hint: 'Select severity',
                items: _severityOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select severity';
                  }
                  return null;
                },
                onChanged: (value) => setState(() => painClinicCubit.severity = value),
              ),
              SizedBox(height: 20),

              // Cause of Pain Input
              _buildSectionHeader('What do you think is causing the pain:'),
              SizedBox(height: 8),

              CustomTextField(
                hint: "Enter suspected cause of pain",
                hintColor: AppColors.kTextPrimaryColor,
                borderColor: Colors.white,
                radius: 12.r,
                fillColor: Colors.white,
                maxLine: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter cause of pain';
                  }
                  return null;
                },
                onSaved: (value) => painClinicCubit.causeOfPain = value,

              ),

              SizedBox(height: 32),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: _submitForm,
                  child: Text(
                    'Submit Assessment',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.grey[700],
        fontSize: 15,
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required Function(String?) onChanged,
    required FormFieldValidator<String>? validator,
  }) {
    return FormField<String>(
      validator: validator,
      builder: (formFieldState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: formFieldState.hasError
                      ? Colors.red
                      : Colors.grey.shade300,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  hint: Text(hint),
                  isExpanded: true,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    onChanged(value);
                    formFieldState.didChange(value);
                  },
                ),
              ),
            ),
            if (formFieldState.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                child: Text(
                  formFieldState.errorText!,
                  style: TextStyle(
                    color: Colors.red.shade700,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Process the data
      context.read<PainClinicCubit>().addPainAssessment();
      Navigator.pop(context);
    }
  }
}
