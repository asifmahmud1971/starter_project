import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';

class FollowUpDetails extends StatelessWidget {
  final Followup? followup;

  const FollowUpDetails({super.key, this.followup});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Patient Follow-Ups'),
      ),
      body: FollowUpDetailsCard(
        dateTime: followup?.date ?? "",
        place: followup?.place ?? "",
        vType: followup?.type ?? "",
        bp: '${followup?.bpHigh ?? "max"}/${followup?.bpMin ?? "min"}',
        pulse: followup?.pulse ?? "",
        saturation: followup?.saturation ?? "",
        o2: followup?.oxygen ?? "",
        temp: followup?.temp ?? "",
        inValue: followup?.intake ?? "",
        out: followup?.output ?? "",
        insulin: followup?.insulin ?? "",
        sugar: followup?.sugar ?? "",
        pain: followup?.pain ?? "",
        critical: false,
      ),
    );
  }
}

class FollowUpDetailsCard extends StatelessWidget {
  final String dateTime;
  final String place;
  final String vType;
  final String bp;
  final String pulse;
  final String saturation;
  final String o2;
  final String temp;
  final String inValue;
  final String out;
  final String insulin;
  final String sugar;
  final String pain;
  final bool critical;

  const FollowUpDetailsCard({
    super.key,
    required this.dateTime,
    required this.place,
    required this.vType,
    required this.bp,
    required this.pulse,
    required this.saturation,
    required this.o2,
    required this.temp,
    required this.inValue,
    required this.out,
    required this.insulin,
    required this.sugar,
    required this.pain,
    required this.critical,
  });

  @override
  Widget build(BuildContext context) {
    final parsedDate = DateTime.parse(dateTime);
    final dateFormat = DateFormat('MMM dd, yyyy');
    final timeFormat = DateFormat('hh:mm a');

    return Container(
      color: critical ? Colors.red[50] : Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        vType,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  if (critical)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.warning, size: 14, color: Colors.red),
                          SizedBox(width: 4),
                          Text(
                            'Critical',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    dateFormat.format(parsedDate),
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    timeFormat.format(parsedDate),
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
              16.verticalSpace,
              Row(
                children: [
                  Expanded(
                      child: _buildVitalCard(
                          'Blood Pressure(mmm of Hg)', bp, 'mmHg')),
                  10.horizontalSpace,
                  Expanded(child: _buildVitalCard('Pulse(/min)', pulse, 'bpm')),
                ],
              ),
              10.verticalSpace,
              Row(
                children: [
                  Expanded(
                      child: _buildVitalCard('Saturation(%)', saturation, '%')),
                  10.horizontalSpace,
                  Expanded(
                      child: _buildVitalCard('Oxygen(L)', saturation, '%')),
                ],
              ),
              10.verticalSpace,
              Row(
                children: [
                  Expanded(
                      child:
                          _buildVitalCard('Temperature(degree F)', temp, '°C')),
                  10.horizontalSpace,
                  Expanded(child: _buildVitalCard('Intake(ml)', temp, '°C')),
                ],
              ),
              10.verticalSpace,
              Row(
                children: [
                  Expanded(child: _buildVitalCard('Output(ml)', temp, '°C')),
                  10.horizontalSpace,
                  Expanded(
                      child: _buildVitalCard('Insulin(ml)', insulin, 'units')),
                ],
              ),
              10.verticalSpace,
              Row(
                children: [
                  Expanded(
                      child: _buildVitalCard(
                          'Blood Sugar(mmol/L)', sugar, 'level')),
                  10.horizontalSpace,
                  Expanded(
                      child: _buildVitalCard(
                          'Shortness of Breath', sugar, 'level')),
                ],
              ),
              10.verticalSpace,
              _buildVitalCard('Bowel Movement', sugar, 'level'),
              12.verticalSpace,
              if (pain.isNotEmpty)
                Row(
                  children: [
                    Icon(Icons.health_and_safety,
                        size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 8),
                    Text(
                      'Pain Level: $pain',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVitalCard(String title, String value, String unit) {
    Color valueColor = Colors.teal;

    // Custom coloring based on values
    if (title == 'BP') {
      final parts = value.split('/');
      if (parts.length == 2) {
        final systolic = int.tryParse(parts[0]) ?? 0;
        if (systolic > 140) valueColor = Colors.orange;
        if (systolic > 160) valueColor = Colors.red;
      }
    } else if (title == 'Pulse') {
      final pulseValue = int.tryParse(value) ?? 0;
      if (pulseValue > 100) valueColor = Colors.orange;
      if (pulseValue > 120) valueColor = Colors.red;
    } else if (title == 'O₂ Sat') {
      final satValue = int.tryParse(value) ?? 0;
      if (satValue < 95) valueColor = Colors.orange;
      if (satValue < 90) valueColor = Colors.red;
    } else if (title == 'Temp') {
      final tempValue = double.tryParse(value) ?? 0;
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
            title,
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
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: valueColor,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
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
