import 'package:flutter/material.dart';

class VitalCard extends StatelessWidget {
  final String? title;
 final String? value;
     final String? unit;


  const VitalCard({super.key, this.title, this.value, this.unit});

  @override
  Widget build(BuildContext context) {
    Color valueColor = Colors.teal;

    // Custom coloring based on values
    if (title == 'BP') {
      final parts = value?.split('/');
      if (parts?.length == 2) {
        final systolic = int.tryParse(parts![0]) ?? 0;
        if (systolic > 140) valueColor = Colors.orange;
        if (systolic > 160) valueColor = Colors.red;
      }
    } else if (title == 'Pulse') {
      final pulseValue = int.tryParse(value??"") ?? 0;
      if (pulseValue > 100) valueColor = Colors.orange;
      if (pulseValue > 120) valueColor = Colors.red;
    } else if (title == 'O₂ Sat') {
      final satValue = int.tryParse(value??"") ?? 0;
      if (satValue < 95) valueColor = Colors.orange;
      if (satValue < 90) valueColor = Colors.red;
    } else if (title == 'Temp') {
      final tempValue = double.tryParse(value??"") ?? 0;
      if (tempValue > 37.5) valueColor = Colors.orange;
      if (tempValue > 38.5) valueColor = Colors.red;
    } else if (title == 'Sugar') {
      if (value == 'High') valueColor = Colors.red;
      if (value == 'Elevated') valueColor = Colors.orange;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title??"",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value??"",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: valueColor,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                unit??"",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
