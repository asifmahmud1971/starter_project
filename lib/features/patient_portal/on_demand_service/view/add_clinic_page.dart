import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_text_field.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_print.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/cubit/onDemand_service_cubit.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/widget/city_dropdown_widget.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/widget/thana_dropdown_widget.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/cubit/followup_cubit.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/widget/build_smart_dropdown_widget.dart';

import '../model/city_response.dart';

class AddClinicPage extends StatefulWidget {
  const AddClinicPage({super.key});

  @override
  State<AddClinicPage> createState() => _AddClinicPageState();
}

class _AddClinicPageState extends State<AddClinicPage> {
  final OnDemandServiceCubit onDemandCubit =
      GetContext.context.read<OnDemandServiceCubit>();

  @override
  void initState() {
    onDemandCubit.getPatientPackage();
    onDemandCubit.getCity();
    super.initState();
  }

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000), // Default DOB
      firstDate: DateTime(1900),
      lastDate: DateTime.now(), // Prevent future dates
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        onDemandCubit.startServiceDateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Clinic', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.kPrimaryColor,
      ),
      body: BlocBuilder<OnDemandServiceCubit, OnDemandServiceState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: onDemandCubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      _BuildSmartVitalRow(
                        label: 'Patient Name',
                        isOptional: true,
                        firstField: CustomTextField(
                          controller: onDemandCubit.patientNameController,
                          radius: 8.r,
                          hint: "Enter Patient name",
                          validator: onDemandCubit.validator,
                        ),
                      ),
                      10.verticalSpace,
                      _BuildSmartVitalRow(
                        label: 'Age',
                        isOptional: true,
                        firstField: CustomTextField(
                          controller: onDemandCubit.ageController,
                          radius: 8.r,
                          hint: "Enter Patient name",
                          validator: onDemandCubit.validator,
                        ),
                      ),
                      10.verticalSpace,
                      /*Text('Gender',style: kBodyMedium),
                        10.verticalSpace,
                        BuildSmartDropdown(
                          value: profileCubit.selectGender,
                          hint: 'Select Functional Status',
                          items: profileCubit.genderList,
                          onChanged:  (value) => setState(() {
                            profileCubit.selectGender = value;
                          }),
                        ),*/

                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Gender",
                        style: kBodyMedium.copyWith(color: AppColors.kGrayColor600),
                      ),
                      Text(
                        "*",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.kError400,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  5.verticalSpace,
                  BuildSmartDropdown(
                    value: onDemandCubit.selectGender,
                    hint: 'Select gender',
                    items: onDemandCubit.genderList,
                    onChanged: (value) => setState(() {
                      onDemandCubit.selectGender = value;
                    }),
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      Text(
                        "City",
                        style: kBodyMedium.copyWith(color: AppColors.kGrayColor600),
                      ),
                      Text(
                        "*",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.kError400,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  5.verticalSpace,
                  CityBuildSmartDropdown(
                    value: onDemandCubit.selectCity,
                    // This should be a City object, not just a string
                    hint: 'Select City',
                    items: state.city?.city ?? [],
                    onChanged: (City? value) {
                      if (value != null) {
                        setState(() {
                          onDemandCubit.selectCity =
                              value; // Store the whole City object
                          printLog("------- ${value.id}");
                          onDemandCubit.getThana(id: value.id);
                        });
                      }
                    },
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      Text(
                        "Thana",
                        style: kBodyMedium.copyWith(color: AppColors.kGrayColor600),
                      ),
                      Text(
                        "*",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.kError400,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  5.verticalSpace,
                  ThanaBuildSmartDropdown(
                    value: onDemandCubit.selectThana,
                    hint: 'Select Thana',
                    items: state.thana?.thana ?? [],
                    onChanged: state.thana?.thana != null
                        ? (value) => setState(() {
                      onDemandCubit.selectThana = value;
                    })
                        : null,
                  ),
                  10.verticalSpace,
                  _BuildSmartVitalRow(
                    label: 'Address',
                    isOptional: true,
                    firstField: CustomTextField(
                      controller: onDemandCubit.addressController,
                      radius: 8.r,
                      hint: "Enter your Address",
                      validator: onDemandCubit.validator,
                    ),
                  ),
                  10.verticalSpace,
                  _BuildSmartVitalRow(
                    label: 'Phone',
                    firstField: CustomTextField(
                      controller: onDemandCubit.phoneController,
                      radius: 8.r,
                      hint: "Enter your phone",
                      validator: onDemandCubit.validator,
                    ),
                  ),
                  10.verticalSpace,
                  _BuildSmartVitalRow(
                    label: 'Email',
                    firstField: CustomTextField(
                      controller: onDemandCubit.emailController,
                      radius: 8.r,
                      hint: "Enter your Email",
                    ),
                  ),
                  10.verticalSpace,
                  _BuildSmartVitalRow(
                    label: 'Current Package',
                    firstField: CustomTextField(
                      controller: onDemandCubit.currentPackageController,
                      radius: 8.r,
                      hint: "Enter your current package",
                    ),
                  ),
                  10.verticalSpace,
                  CustomTextField(
                      controller: onDemandCubit.startServiceDateController,
                      isOptional: false,
                      readOnly: true,
                      titleStyle: kBodyMedium,
                      title: "When to start the service (Date)",
                      hint: "dd/mm/yyyy",
                      hintColor: AppColors.kGrayColor400,
                      textColor: AppColors.kGrayColor950,
                      fillColor: AppColors.kWhiteColor,
                      radius: 10,
                      borderThink: 1,
                      keyboardType: TextInputType.name,
                      suffixIcon: InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Icon(
                          Icons.calendar_month_sharp,
                          color: AppColors.kGrayColor,
                        ),
                      ),
                  ),
                  10.verticalSpace,
                  _BuildSmartVitalRow(
                    label: 'Legal Representive Name',
                    firstField: CustomTextField(
                      controller: onDemandCubit.representativeNameController,
                      radius: 8.r,
                      hint: "Legal Representive Name",
                    ),
                  ),
                  10.verticalSpace,
                  _BuildSmartVitalRow(
                    label: 'Mobile No (Primary)',
                    firstField: CustomTextField(
                      controller: onDemandCubit.mobileNoPrimaryController,
                      radius: 8.r,
                      hint: "Mobile No",
                    ),
                  ),
                  10.verticalSpace,
                  _BuildSmartVitalRow(
                    label: 'Mobile No (Alternative)',
                    firstField: CustomTextField(
                      controller: onDemandCubit.mobileNoAlternativeController,
                      radius: 8.r,
                      hint: "Mobile No",
                    ),
                  ),
                  10.verticalSpace,
                  _BuildSmartVitalRow(
                    label: 'Legal Representive Email',
                    firstField: CustomTextField(
                      controller: onDemandCubit.representativeEmailController,
                      radius: 8.r,
                      hint: "Legal Representive Email",
                    ),
                  ),
                  30.verticalSpace,
                  Center(
                    child: ElevatedButton.icon(
                      label: Text(
                        "Submit",
                        style: TextStyle(letterSpacing: 1),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor:
                        AppColors.kPrimaryColor.withValues(alpha: 0.7),
                        foregroundColor: Colors.white,
                        elevation: 4,
                      ),
                      onPressed: (){
                        if (onDemandCubit.formKey.currentState!.validate()) {
                          context.read<OnDemandServiceCubit>().addClinic();
                        }
                      },

                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}

class _BuildSmartVitalRow extends StatelessWidget {
  final String? label;
  final Widget firstField;
  final bool isOptional;

  const _BuildSmartVitalRow({
    super.key,
    this.label,
    this.isOptional=false,
    required this.firstField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label ?? "",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
            isOptional?Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                "*",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.kError400,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ):SizedBox.shrink()
          ],
        ),
        8.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: firstField),
          ],
        ),
      ],
    );
  }
}
