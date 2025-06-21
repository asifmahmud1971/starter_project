import 'package:flutter/material.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/city_response.dart';

import '../../../../../core/constants/app_colors.dart';

class CityBuildSmartDropdown extends StatelessWidget {
  final City? value; // Change from String? to City?
  final String? hint;
  final List<City>? items;
  final IconData? icon;
  final Function(City?)? onChanged;
  final String? Function(City?)? validator; // Change validator type
  final Widget? prefixIcon;

  const CityBuildSmartDropdown({
    super.key,
    this.value,
    this.hint,
    this.items,
    this.icon,
    this.onChanged,
    this.validator,
    this.prefixIcon
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<City>( // Change from String to City
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
              prefixIcon: icon != null
                  ? Icon(icon, color: AppColors.kPrimaryColor)
                  : null,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            items: items?.map((City city) {
              return DropdownMenuItem<City>(
                value: city,
                child: Text(
                  city.name ?? '',
                  maxLines: 1,
                ),
              );
            }).toList(),
            onChanged: onChanged,
            validator: validator != null
                ? (City? city) => validator!(city)
                : (City? city) {
              if (city == null || city.name == null || city.name!.isEmpty) {
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