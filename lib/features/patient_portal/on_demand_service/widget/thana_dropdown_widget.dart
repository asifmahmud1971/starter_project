import 'package:flutter/material.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/city_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/thana_response.dart';

import '../../../../../core/constants/app_colors.dart';

class ThanaBuildSmartDropdown extends StatelessWidget {
  final Thana? value; // Change from String? to Thana?
  final String? hint;
  final List<Thana>? items;
  final Function(Thana?)? onChanged;
  final String? Function(Thana?)? validator; // Change validator type
  final Widget? prefixIcon;

  const ThanaBuildSmartDropdown({
    super.key,
    this.value,
    this.hint,
    this.items,
    this.onChanged,
    this.validator,
    this.prefixIcon
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<Thana>( // Change from String to City
            value: value,
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            items: items!.map((Thana thana) {
              return DropdownMenuItem<Thana>(
                value: thana,
                child: Text(
                  thana.name ?? '',
                  maxLines: 1,
                ),
              );
            }).toList(),
            onChanged: onChanged,
            validator: validator != null
                ? (Thana? thana) => validator!(thana)
                : (Thana? thana) {
              if (thana == null || thana.name == null || thana.name!.isEmpty) {
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