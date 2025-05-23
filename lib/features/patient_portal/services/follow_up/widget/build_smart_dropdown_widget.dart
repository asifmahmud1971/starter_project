import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

class BuildSmartDropdown extends StatelessWidget {
  final String? value;
  final String? hint;
  final List<String>? items;
  final IconData? icon;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  const BuildSmartDropdown({super.key, this.value, this.hint, this.items, this.icon, this.onChanged, this.validator});

  @override
  Widget build(BuildContext context) {
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
            items: items?.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  maxLines: 1,
                ),
              );
            }).toList(),
            onChanged: onChanged,
            validator: validator??(value) {
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
  }
}
