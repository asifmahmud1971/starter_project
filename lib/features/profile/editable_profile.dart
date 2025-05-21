import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_button.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/profile/cubit/profile_cubit.dart';
import '../../core/components/custom_text_field.dart';
import '../../core/constants/app_colors.dart';

class EditAbleProfileScreen extends StatefulWidget {
  const EditAbleProfileScreen({super.key});

  @override
  State<EditAbleProfileScreen> createState() => _EditAbleProfileScreenState();
}

class _EditAbleProfileScreenState extends State<EditAbleProfileScreen> {
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

  final profileCubit =  GetContext.context.read<ProfileCubit>();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFF904D);
    const secondaryColor = Color(0xFF394294);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Patient Profile',style: kTitleMedium),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Profile Header
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
                color: secondaryColor,
                children: [
                  CustomTextField(
                    controller: profileCubit.nameController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Name",
                    hint: "Full name",
                    hintColor: AppColors.kGrayColor200,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    borderColor: AppColors.kGrayColor400,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.ageController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Age",
                    hint: "Age",
                    hintColor: AppColors.kGrayColor200,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    borderColor: AppColors.kGrayColor400,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.genderController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Gender",
                    hint: "Gender",
                    hintColor: AppColors.kGrayColor200,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    borderColor: AppColors.kGrayColor400,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.dateOfBirthController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Date of Birth",
                    hint: "Date of Birth",
                    hintColor: AppColors.kGrayColor200,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    borderColor: AppColors.kGrayColor400,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),

                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.bloodGroupController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Blood Group",
                    hint: "Blood Group",
                    hintColor: AppColors.kGrayColor200,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    borderColor: AppColors.kGrayColor400,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.maritalStatusController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Marital Status",
                    hint: "Marital Status",
                    hintColor: AppColors.kGrayColor200,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    borderColor: AppColors.kGrayColor400,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                ],
              ),

              // Contact Information
              _buildEditableSection(
                icon: Icons.phone,
                title: "Contact Information",
                color: primaryColor,
                children: [
                  CustomTextField(
                    controller: profileCubit.mobileNoController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Mobile No",
                    hint: "Mobile No",
                    hintColor: AppColors.kGrayColor200,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    borderColor: AppColors.kGrayColor400,
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
                    hintColor: AppColors.kGrayColor200,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    borderColor: AppColors.kGrayColor400,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.addressController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Address",
                    hint: "Address",
                    hintColor: AppColors.kGrayColor200,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    borderColor: AppColors.kGrayColor400,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  )
                ],
              ),

              // Emergency Contacts
              _buildEditableSection(
                icon: Icons.emergency,
                title: "Emergency Contacts",
                color: Colors.red,
                children: [
                  CustomTextField(
                    controller: profileCubit.contactPersonController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Contact Person",
                    hint: "Contact Person",
                    hintColor: AppColors.kGrayColor200,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    borderColor: AppColors.kGrayColor400,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.contactNumberController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Contact Number",
                    hint: "Contact Number",
                    hintColor: AppColors.kGrayColor200,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    borderColor: AppColors.kGrayColor400,
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
                    hintColor: AppColors.kGrayColor200,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    borderColor: AppColors.kGrayColor400,
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
                    hintColor: AppColors.kGrayColor200,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    borderColor: AppColors.kGrayColor400,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    controller: profileCubit.coMorbidityController,
                    isOptional: false,
                    titleStyle: kBodyMedium,
                    title: "Co-morbidities",
                    hint: "Co-morbidities",
                    hintColor: AppColors.kGrayColor200,
                    textColor: AppColors.kGrayColor950,
                    fillColor: AppColors.kWhiteColor,
                    borderColor: AppColors.kGrayColor400,
                    radius: 10,
                    borderThink: 1,
                    keyboardType: TextInputType.name,
                  )
                ],
              ),
              20.verticalSpace,
              CustomButton(
                title: "Confirm",
                onTap: (){},
              )
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