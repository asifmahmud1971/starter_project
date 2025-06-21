import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_button.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/patient_portal/services/psych_social_clinic/cubit/psych_social_cubit.dart';

class AddPsychoSocialScreen extends StatefulWidget {
  const AddPsychoSocialScreen({super.key});

  @override
  State<AddPsychoSocialScreen> createState() => _AddPsychoSocialScreenState();
}

class _AddPsychoSocialScreenState extends State<AddPsychoSocialScreen> {
  final PsychSocialCubit psychSocialCubit = GetContext.context.read<PsychSocialCubit>();
  @override
  void initState() {
    psychSocialCubit.clearOptionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psycho-Social Assessment'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQuestionDropdown(
              'Have you been feeling anxious or worried about your illness or treatment?',
              psychSocialCubit.anxiousValue,
              (value) => setState(() => psychSocialCubit.anxiousValue = value),
            ),
            const SizedBox(height: 16),
            _buildQuestionDropdown(
              'Have any of your family or friends been anxious or worried about you?',
              psychSocialCubit.familyAnxiousValue,
              (value) => setState(() => psychSocialCubit.familyAnxiousValue = value),
            ),
            const SizedBox(height: 16),
            _buildQuestionDropdown(
              'Have you been feeling depressed?',
              psychSocialCubit.depressedValue,
              (value) => setState(() => psychSocialCubit.depressedValue = value),
            ),
            const SizedBox(height: 16),
            _buildQuestionDropdown(
              'Have you felt at peace?',
              psychSocialCubit.flatPeaceValue,
              (value) => setState(() => psychSocialCubit.flatPeaceValue = value),
            ),
            const SizedBox(height: 16),
            _buildQuestionDropdown(
              'Have you been able to share how you are feeling with your family or friends as much as you wanted?',
              psychSocialCubit.shareFeelingsValue,
              (value) => setState(() => psychSocialCubit.shareFeelingsValue = value),
            ),
            const SizedBox(height: 16),
            _buildQuestionDropdown(
              'Have you had as much information as you wanted?',
              psychSocialCubit.informationValue,
              (value) => setState(() => psychSocialCubit.informationValue = value),
            ),
            20.verticalSpace,
            CustomButton(
              title: "Confirm",
              onTap: () {
                psychSocialCubit.addPsychoSocial();
              },
              backgroundColor: AppColors.kPrimaryColor,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionDropdown(
      String question, String? selectedValue, ValueChanged<String?> onChanged) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedValue,
              decoration: InputDecoration(
                hintText: 'Select an option',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              items: psychSocialCubit.optionsList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: onChanged,
              isExpanded: true,
            ),
          ],
        ),
      ),
    );
  }

 /* void _submitForm() {
    if (_anxiousValue == null ||
        _friendsAnxiousValue == null ||
        _depressedValue == null ||
        _peaceValue == null ||
        _shareFeelingsValue == null ||
        _informationValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please answer all questions')),
      );
      return;
    }

    // Process the form submission here
    final result = {
      'anxious': _anxiousValue,
      'friends_anxious': _friendsAnxiousValue,
      'depressed': _depressedValue,
      'at_peace': _peaceValue,
      'share_feelings': _shareFeelingsValue,
      'information': _informationValue,
    };

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thank You'),
        content: const Text('Your responses have been submitted.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );

    // Reset form after submission
    setState(() {
      _anxiousValue = null;
      _friendsAnxiousValue = null;
      _depressedValue = null;
      _peaceValue = null;
      _shareFeelingsValue = null;
      _informationValue = null;
    });
  }*/
}
