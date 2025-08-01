import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';

class BuildSmartDropdown extends StatelessWidget {
  final String? value;
  final String? hint;
  final List<String>? items;
  final IconData? icon;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;

  const BuildSmartDropdown({
    super.key,
    this.value,
    this.hint,
    this.items,
    this.icon,
    this.onChanged,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    // Check if items is null or empty
    final bool hasItems = items != null && items!.isNotEmpty;

    // Check if value is null or not in items list
    final bool isValidValue = value != null && hasItems && items!.contains(value);

    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            // Only set value if it's valid
            value: isValidValue ? value : null,
            isExpanded: true,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.kBorderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.kBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.kPrimaryColor),
              ),
              prefixIcon: icon != null ? Icon(icon, color: AppColors.kPrimaryColor) : null,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            // Create items only if items is not null and rename variable to avoid confusion
            items: hasItems
                ? items!.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  maxLines: 1,
                ),
              );
            }).toList()
                : [],
            onChanged: onChanged,
            validator: validator ?? (value) {
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