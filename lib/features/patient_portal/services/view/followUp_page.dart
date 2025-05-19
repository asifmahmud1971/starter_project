import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/features/patient_portal/services/view/add_followUp.dart';



class FollowUpScreen extends StatelessWidget {
  const FollowUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Patient Follow-Ups'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download, size: 26),
            onPressed: () => _showDownloadOptions(context),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          _buildHeaderSection(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 80),
              children: const [
                FollowUpCard(
                  dateTime: '2025-05-05 16:25:00',
                  place: 'Clinic Visit',
                  vType: 'Routine Check',
                  bp: '120/80',
                  pulse: '72',
                  saturation: '98',
                  o2: '21',
                  temp: '36.6',
                  inValue: '1500',
                  out: '1200',
                  insulin: '8',
                  sugar: 'Normal',
                  pain: 'None',
                  critical: false,
                ),
                FollowUpCard(
                  dateTime: '2025-05-04 10:15:00',
                  place: 'Home Visit',
                  vType: 'Post-Op',
                  bp: '130/85',
                  pulse: '68',
                  saturation: '97',
                  o2: '2',
                  temp: '37.1',
                  inValue: '1800',
                  out: '1500',
                  insulin: '10',
                  sugar: 'Elevated',
                  pain: 'Mild',
                  critical: false,
                ),
                FollowUpCard(
                  dateTime: '2025-05-02 08:45:00',
                  place: 'Emergency',
                  vType: 'Acute',
                  bp: '150/95',
                  pulse: '92',
                  saturation: '89',
                  o2: '4',
                  temp: '38.2',
                  inValue: '2000',
                  out: '800',
                  insulin: '12',
                  sugar: 'High',
                  pain: 'Severe',
                  critical: true,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {GetContext.to(AddFollowUpScreen());},
        icon: const Icon(Icons.add),
        label: const Text('New Entry'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Patient Follow-Ups',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildStatCard('Total', '24', Icons.calendar_today),
              const SizedBox(width: 12),
              _buildStatCard('Critical', '3', Icons.warning, color: Colors.orange),
              const SizedBox(width: 12),
              _buildStatCard('Today', '1', Icons.today, color: Colors.teal),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, {Color color = Colors.grey}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDownloadOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Export Report',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                title: const Text('PDF Format'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('PDF report generated')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.table_chart, color: Colors.blue),
                title: const Text('Excel Format'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Excel report generated')),
                  );
                },
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FollowUpCard extends StatelessWidget {
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

  const FollowUpCard({
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

    return Card(
      color: critical ? Colors.red[50] : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildVitalCard('BP', bp, 'mmHg'),
                _buildVitalCard('Pulse', pulse, 'bpm'),
                _buildVitalCard('O₂ Sat', saturation, '%'),
                _buildVitalCard('Temp', temp, '°C'),
                _buildVitalCard('Insulin', insulin, 'units'),
                _buildVitalCard('Sugar', sugar, 'level'),
              ],
            ),
            const SizedBox(height: 12),
            if (pain.isNotEmpty)
              Row(
                children: [
                  Icon(Icons.health_and_safety, size: 16, color: Colors.grey[600]),
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
