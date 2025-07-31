import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {



  static const kPrimaryColor = Color(0xFFFF904D);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController(text: 'fff');
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController(text: '12/31/2024');
  final TextEditingController _presentAddressController = TextEditingController(text: 'tdhf');
  final TextEditingController _permanentAddressController = TextEditingController();
  final TextEditingController _parentsNidController = TextEditingController();
  final TextEditingController _nidController = TextEditingController(text: '3454534');
  final TextEditingController _altMobileController = TextEditingController();

  String? _selectedGender = 'Male';
  final List<String> _genders = ['Male', 'Female', 'Other'];

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _fatherNameController.dispose();
    _motherNameController.dispose();
    _dobController.dispose();
    _presentAddressController.dispose();
    _permanentAddressController.dispose();
    _parentsNidController.dispose();
    _nidController.dispose();
    _altMobileController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: kPrimaryColor,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('MM/dd/yyyy').format(picked);
      });
    }
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Process data
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppStrings.title.tr()),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: kPrimaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: _saveProfile,
            child:  Text(
              AppStrings.save.tr(),
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
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
              // Section Header
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:  Text(
                  AppStrings.personalInfo.tr(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C3E50),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              _buildStyledTextField(
                controller: _firstNameController,
                label: AppStrings.firstName.tr(),
                icon: Icons.person_outline,
                validator: (value) => value == null || value.isEmpty ? AppStrings.enterFirstName.tr() : null,
              ),
              const SizedBox(height: 16),

              _buildStyledTextField(
                controller: _lastNameController,
                label: AppStrings.lastName.tr(),
                icon: Icons.person_outline,
                validator: (value) => value == null || value.isEmpty ? AppStrings.enterLastName.tr() : null,
              ),
              const SizedBox(height: 16),

              _buildStyledTextField(controller: _fatherNameController, label: AppStrings.fatherName.tr(), icon: Icons.family_restroom_outlined),
              const SizedBox(height: 16),

              _buildStyledTextField(controller: _motherNameController, label: AppStrings.motherName.tr(), icon: Icons.family_restroom_outlined),
              const SizedBox(height: 16),

              _buildStyledTextField(
                controller: _dobController,
                label: AppStrings.dob.tr(),
                icon: Icons.cake_outlined,
                readOnly: true,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today, color: kPrimaryColor),
                  onPressed: () => _selectDate(context),
                ),
                validator: (value) => value == null || value.isEmpty ? AppStrings.enterDob.tr() : null,
              ),
              const SizedBox(height: 16),

              _buildStyledDropdown(
                value: _selectedGender,
                items: _genders,
                label: AppStrings.gender.tr(),
                icon: Icons.wc_outlined,
                onChanged: (newValue) => setState(() => _selectedGender = newValue),
                validator: (value) => value == null ? AppStrings.enterGender.tr() : null,
              ),
              const SizedBox(height: 16),

              _buildStyledTextField(
                controller: _presentAddressController,
                label: AppStrings.presentAddress.tr(),
                icon: Icons.home_outlined,
                maxLines: 3,
                validator: (value) => value == null || value.isEmpty ? AppStrings.enterPresentAddress.tr() : null,
              ),
              const SizedBox(height: 16),

              _buildStyledTextField(controller: _permanentAddressController, label: AppStrings.permanentAddress.tr(), icon: Icons.location_city_outlined, maxLines: 3),
              const SizedBox(height: 16),

              _buildStyledTextField(controller: _parentsNidController, label: AppStrings.parentsNid.tr(), icon: Icons.perm_identity_outlined, keyboardType: TextInputType.number),
              const SizedBox(height: 16),

              _buildStyledTextField(
                controller: _nidController,
                label: AppStrings.nid.tr(),
                icon: Icons.credit_card_outlined,
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty ? AppStrings.enterNid.tr() : null,
              ),
              const SizedBox(height: 16),

              _buildStyledTextField(
                controller: _altMobileController,
                label: AppStrings.altMobile.tr(),
                icon: Icons.phone_outlined,
                hintText: AppStrings.hintAltMobile.tr(),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 32),

              // Save Button
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [kPrimaryColor, Color(0xFFFF7043)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child:  Text(
                    AppStrings.updateProfile.tr(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// TextField Widget
  Widget _buildStyledTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hintText,
    int maxLines = 1,
    bool readOnly = false,
    Widget? suffixIcon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 16, bottom: 4),
            child: Text(label, style: kBodyLarge),
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: kPrimaryColor),
              ),
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            ),
            maxLines: maxLines,
            readOnly: readOnly,
            keyboardType: keyboardType,
            validator: validator,
            style: const TextStyle(fontSize: 16, color: Color(0xFF2C3E50)),
          ),
        ],
      ),
    );
  }

  /// Dropdown Widget
  Widget _buildStyledDropdown({
    required String? value,
    required List<String> items,
    required String label,
    required IconData icon,
    required void Function(String?)? onChanged,
    String? Function(String?)? validator,
  }) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 16, bottom: 4),
            child: Text(label, style: kBodyLarge),
          ),
          DropdownButtonFormField<String>(
            value: value,
            decoration: InputDecoration(
              prefixIcon: Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: kPrimaryColor),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            ),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
            validator: validator,
            style: const TextStyle(fontSize: 16, color: Color(0xFF2C3E50)),
          ),
        ],
      ),
    );
  }
}
