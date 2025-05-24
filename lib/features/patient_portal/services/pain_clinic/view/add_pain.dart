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
import 'package:medPilot/features/patient_portal/services/pain_clinic/helper/pain_assessmentList.dart';

class AddPainAssessmentScreen extends StatefulWidget {
  @override
  _AddPainAssessmentScreenState createState() =>
      _AddPainAssessmentScreenState();
}

class _AddPainAssessmentScreenState extends State<AddPainAssessmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final PainClinicCubit painClinicCubit =
      GetContext.context.read<PainClinicCubit>();



  @override
  void initState() {
    // TODO: implement initState
    context.read<PainClinicCubit>().resetScreen();
    super.initState();
  }

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
              24.verticalSpace,
              // Location Input
              _buildSectionHeader('${AppStrings.location.tr()}:'),
              8.verticalSpace,
              CustomTextField(
                hint: "Where is the pain located?",
                borderColor: Colors.white,
                hintColor: AppColors.kTextPrimaryColor,
                radius: 12.r,
                textColor: AppColors.kTextPrimaryColor,
                fillColor: Colors.white,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter pain location';
                  }
                  return null;
                },
                onSaved: (value) => painClinicCubit.location = value,
              ),
              20.verticalSpace,
              // Change of Time Dropdown
              _buildSectionHeader('Change Of Time:'),
              8.verticalSpace,
              _buildDropdown(
                value: painClinicCubit.changeOfTime,
                hint: 'Select change of time',
                items: timeOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select change of time';
                  }
                  return null;
                },
                onChanged: (value) =>
                    setState(() => painClinicCubit.changeOfTime = value),
              ),
              20.verticalSpace,
              // Radiation Input
              _buildSectionHeader('Radiation:'),
              8.verticalSpace,
              CustomTextField(
                hint: "Does the pain radiate anywhere?",
                borderColor: Colors.white,
                hintColor: AppColors.kTextPrimaryColor,
                textColor: AppColors.kTextPrimaryColor,
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
              20.verticalSpace,
              // Relieving Factors Dropdown
              _buildSectionHeader('Relieving factors:'),
              8.verticalSpace,
              _buildDropdown(
                value: painClinicCubit.relievingFactors,
                hint: 'Select relieving factors',
                items: reliefOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select relieving factors';
                  }
                  return null;
                },
                onChanged: (value) =>
                    setState(() => painClinicCubit.relievingFactors = value),
              ),
              20.verticalSpace,
              // Severity Dropdown
              _buildSectionHeader('Severity:'),
              8.verticalSpace,
              _buildDropdown(
                value: painClinicCubit.severity,
                hint: 'Select severity',
                items: severityOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select severity';
                  }
                  return null;
                },
                onChanged: (value) =>
                    setState(() => painClinicCubit.severity = value),
              ),
              20.verticalSpace,
              // Cause of Pain Input
              _buildSectionHeader('What do you think is causing the pain:'),
              8.verticalSpace,

              CustomTextField(
                hint: "Enter suspected cause of pain",
                hintColor: AppColors.kTextPrimaryColor,
                borderColor: Colors.white,
                textColor: AppColors.kTextPrimaryColor,
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
              32.verticalSpace,
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
                    AppStrings.submitAssessment.tr(),
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
    }
  }
}
