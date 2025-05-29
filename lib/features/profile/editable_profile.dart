import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_button.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/widget/build_smart_dropdown_widget.dart';
import 'package:medPilot/features/profile/cubit/profile_cubit.dart';
import '../../core/components/custom_text_field.dart';
import '../../core/constants/app_colors.dart';

class EditAbleProfileScreen extends StatefulWidget {
  const EditAbleProfileScreen({super.key});

  @override
  State<EditAbleProfileScreen> createState() => _EditAbleProfileScreenState();
}

class _EditAbleProfileScreenState extends State<EditAbleProfileScreen> {
  final profileCubit =  GetContext.context.read<ProfileCubit>();
  bool isEditing = false;
  final _formKey = GlobalKey<FormState>();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
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
        profileCubit.dateOfBirthController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kGrayColor50,
      appBar: AppBar(
        title: Text('Patient Profile',style: kTitleMedium),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                children: [
                  10.verticalSpace,
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    clipBehavior: Clip.none,
                    children: [
                      _image != null
                          ? CircleAvatar(
                        radius: 45,
                        backgroundColor: AppColors.kGrayColor600,
                        backgroundImage: FileImage(_image!),
                      ) : CircleAvatar(
                        radius: 45,
                        backgroundColor: AppColors.kGrayColor200,
                        backgroundImage: CachedNetworkImageProvider(
                            "https://picsum.photos/2000" ?? ""),
                      ),
                      InkWell(
                        onTap: ()=> _pickImage(ImageSource.gallery),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child:  Icon(Icons.edit,size: 16,),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              _buildEditableSection(
                icon: Icons.person,
                title: "Personal Information",
                color: AppColors.kPrimarySpeechBlue800,
                children: [
                  CustomTextField(
                    controller: profileCubit.nameController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Name",
                    hint: "Full name",
                    hintColor: AppColors.kGrayColor400,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  Text('Gender',style: kBodyMedium),
                  10.verticalSpace,
                  BuildSmartDropdown(
                    value: profileCubit.selectGender,
                    hint: 'Select Functional Status',
                    items: profileCubit.genderList,
                    onChanged:  (value) => setState(() {
                      profileCubit.selectGender = value;
                    }),
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.dateOfBirthController,
                    isOptional: false,
                    readOnly: true,
                    titleStyle: kBodyMedium,
                    title: "Date of Birth",
                    hint: "Date of Birth",
                    hintColor: AppColors.kGrayColor400,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                      suffixIcon: InkWell(
                          onTap: (){
                            _selectDate(context);
                          },
                          child: Icon(Icons.calendar_month_sharp,color: AppColors.kGrayColor,),
                      )
                  ),
                  10.verticalSpace,
                  Text('Blood Group',style: kBodyMedium),
                  10.verticalSpace,
                  BuildSmartDropdown(
                    value: profileCubit.selectBloodGroup,
                    hint: 'Select Functional Status',
                    items: profileCubit.bloodGroupList,
                    onChanged:  (value) => setState(() {
                      profileCubit.selectBloodGroup = value;
                    }),
                  ),
                  10.verticalSpace,
                  Text('Marital Status',style: kBodyMedium),
                  10.verticalSpace,
                  BuildSmartDropdown(
                    value: profileCubit.selectMaritalStatus,
                    hint: 'Select Functional Status',
                    items: profileCubit.maritalStatusList,
                    onChanged:  (value) => setState(() {
                      profileCubit.selectMaritalStatus = value;
                    }),
                  ),
                ],
              ),

              // Contact Information
              _buildEditableSection(
                icon: Icons.phone,
                title: "Contact Information",
                color: AppColors.kPrimaryColor,
                children: [
                  CustomTextField(
                    controller: profileCubit.mobileNoController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Mobile No",
                    hint: "Mobile No",
                    hintColor: AppColors.kGrayColor400,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.doctorContactController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Doctor Contact",
                    hint: "Doctor Contact",
                    hintColor: AppColors.kGrayColor400,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.cityController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "City",
                    hint: "City",
                    hintColor: AppColors.kGrayColor400,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.thanaController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Thana",
                    hint: "Thana",
                    hintColor: AppColors.kGrayColor400,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.presentAddressController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Present Address",
                    hint: "Present Address",
                    hintColor: AppColors.kGrayColor400,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.landMarkController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Land Mark",
                    hint: "Land Mark",
                    hintColor: AppColors.kGrayColor400,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.permanentAddressController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Permanent Address",
                    hint: "Permanent Address",
                    hintColor: AppColors.kGrayColor400,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                ],
              ),

              // Emergency Contacts
              _buildEditableSection(
                icon: Icons.emergency,
                title: "Emergency Contacts",
                color: Colors.red,
                children: [
                  CustomTextField(
                    controller: profileCubit.nIDPassportController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "NID/Passport Number",
                    hint: "NID/Passport Number",
                    hintColor: AppColors.kGrayColor400,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.familyContactPersonController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Family Contact Person",
                    hint: "Family Contact Person",
                    hintColor: AppColors.kGrayColor400,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.familyContactNumberController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Family Person Number",
                    hint: "Family Person Number:",
                    hintColor: AppColors.kGrayColor400,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  )
                ],
              ),

              // Medical Information
              _buildEditableSection(
                icon: Icons.medical_information,
                title: "Medical Information",
                color: Colors.green,
                children: [
                  CustomTextField(
                    controller: profileCubit.allergiesController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Allergies",
                    hint: "Allergies",
                    hintColor: AppColors.kGrayColor400,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.primaryDiagnosisController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Primary Diagnosis",
                    hint: "Primary Diagnosis",
                    hintColor: AppColors.kGrayColor400,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                ],
              ),
              10.verticalSpace,
              CustomButton(
                title: "Confirm",
                onTap: (){
                  profileCubit.updateProfile();
                },
                backgroundColor: AppColors.kPrimaryColor,
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableSection({
    required IconData icon,
    required String title,
    required Color color,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}