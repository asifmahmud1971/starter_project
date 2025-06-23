import 'package:flutter/material.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart'; // For opening PDFs/URLs

class LabReport {
  final String date;
  final String testName;
  final String fileUrl;

  LabReport({
    required this.date,
    required this.testName,
    required this.fileUrl,
  });
}

class LabReportPage extends StatelessWidget {
  final List<LabReport> reports = [
    LabReport(
      date: "2025-06-20",
      testName: "Blood Test",
      fileUrl: "https://example.com/lab/bloodtest.pdf",
    ),
    LabReport(
      date: "2025-06-10",
      testName: "X-Ray Chest",
      fileUrl: "https://example.com/lab/xray.pdf",
    ),
  ];

  Future<void> _viewReport(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw "Could not launch report URL.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lab Report")),
      body: reports.isEmpty
          ? const Center(child: Text("No reports available."))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: reports.length,
              itemBuilder: (context, index) {
                final report = reports[index];
                return LabReportCard(report: reports[index]);
              },
            ),
    );
  }
}

class LabReportCard extends StatelessWidget {
  final LabReport report;

  const LabReportCard({super.key, required this.report});

  Future<void> _viewReport(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the report')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.kDecoration,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Test Name
            Text(
              report.testName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            // Date
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  report.date,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // View Button

            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
                label: const Text("View Report",
                    style: TextStyle(color: Colors.white)),
                onPressed: () => _viewReport(context, report.fileUrl),
              ),
            )
          ],
        ),
      ),
    );
  }
}
