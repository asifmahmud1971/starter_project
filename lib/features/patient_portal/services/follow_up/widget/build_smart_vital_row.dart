import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildSmartVitalRow extends StatelessWidget {
  final String? label;
  final Widget firstField;
  final Widget secondField;
  const BuildSmartVitalRow({super.key, this.label, required this.firstField, required this.secondField});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label??"",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            // Icon(Icons.circle, size: 12, color: color),
          ],
        ),
        8.verticalSpace,
        Row(
          children: [
            Expanded(child: firstField),
            const SizedBox(width: 16),
            Expanded(child: secondField),
          ],
        ),
      ],
    );
  }
}
