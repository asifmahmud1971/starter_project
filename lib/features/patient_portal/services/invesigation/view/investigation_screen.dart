import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medPilot/features/patient_portal/services/invesigation/cubit/investigation_cubit.dart';

class InvestigationReportScreen extends StatefulWidget {
  const InvestigationReportScreen({super.key});

  @override
  State<InvestigationReportScreen> createState() => _InvestigationReportScreenState();
}

class _InvestigationReportScreenState extends State<InvestigationReportScreen> {
  @override
  void initState() {
    context.read<InvestigationCubit>().getInvestigationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Report', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Patient Information Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Patient Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                    SizedBox(height: 12),
                    _buildInfoRow('Name', 'Hasan'),
                    _buildInfoRow('Age', '0 Yrs 2 M 26 D'),
                    _buildInfoRow('Gender', 'Male'),
                    _buildInfoRow('Phone', '12343'),
                    _buildInfoRow('Address', 'sdfasdfsdf'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Doctor Information
            Text(
              'Consultation Doctor: Dr. ABC',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Diagnosis Header
            Text(
              'Diagnosis Report',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 12),

            // Diagnosis Table
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Table(
                  border: TableBorder.all(color: Colors.grey[300]!),
                  columnWidths: {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(3),
                    2: FlexColumnWidth(2),
                    3: FlexColumnWidth(2),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.blue[50]),
                      children: [
                        _buildTableCell('Date', isHeader: true),
                        _buildTableCell('Investigation Name', isHeader: true),
                        _buildTableCell('Result', isHeader: true),
                        _buildTableCell('Unit', isHeader: true),
                      ],
                    ),
                    TableRow(
                      children: [
                        _buildTableCell(''),
                        _buildTableCell('Dhaka, Bangladesh'),
                        _buildTableCell(''),
                        _buildTableCell(''),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Hospital Contact Info
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Helpline: 01717926561',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Email: admin@hphospital.com',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Website: www.medpilot.app',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widgets
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: isHeader ? Colors.blue[800] : Colors.black,
        ),
      ),
    );
  }
}