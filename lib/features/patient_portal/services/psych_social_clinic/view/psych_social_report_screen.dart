import 'package:flutter/material.dart';

//class PsychoSocialReportPage extends StatelessWidget {
import 'package:flutter/material.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/features/patient_portal/services/psych_social_clinic/view/add_psych_social_screen.dart';

class PsychoSocialReportPage extends StatelessWidget {
  const PsychoSocialReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'U View Psycho-Social Report',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFf5f7fa),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentPage = 0;
  final List<Map<String, dynamic>> _reports = [
    {
      'id': 1,
      'date': '27-05-2025',
      'anxious': 'Slightly',
      'friendsAnxious': 'Not at All',
      'depressed': 'Not at All',
      'atPeace': 'Not at All',
      'shareFeelings': 'Not at All',
      'information': 'Not at All',
    },
    {
      'id': 2,
      'date': '08-05-2025',
      'anxious': 'N/A',
      'friendsAnxious': 'N/A',
      'depressed': 'N/A',
      'atPeace': 'N/A',
      'shareFeelings': 'N/A',
      'information': 'N/A',
    },
    {
      'id': 3,
      'date': '08-05-2025',
      'anxious': 'N/A',
      'friendsAnxious': 'N/A',
      'depressed': 'N/A',
      'atPeace': 'N/A',
      'shareFeelings': 'N/A',
      'information': 'N/A',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('U View Psycho-Social Report'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                InkWell(
                    onTap: ()=> GetContext.to(AddPsychoSocialScreen()),

                    child: const Icon(Icons.notifications_outlined)),
                const SizedBox(width: 16),
                CircleAvatar(
                  backgroundColor: Colors.blue[800],
                  child:
                      const Text('AD', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 8),
                const Text('Admin User'),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Student Psycho-Social Reports',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Summary Cards
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildSummaryCard('Total Reports', '143',
                      '+12% from last month', Colors.blue),
                  _buildSummaryCard(
                      'Anxiety Cases', '27', '19% of total', Colors.orange),
                  _buildSummaryCard(
                      'Depression Cases', '15', '10% of total', Colors.red),
                  _buildSummaryCard(
                      'Positive Responses', '86', '60% of total', Colors.green),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Filters
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Date Range',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      DropdownButtonFormField(
                        value: 'Last 30 days',
                        items: const [
                          DropdownMenuItem(
                              value: 'Last 7 days', child: Text('Last 7 days')),
                          DropdownMenuItem(
                              value: 'Last 30 days',
                              child: Text('Last 30 days')),
                          DropdownMenuItem(
                              value: 'Last 3 months',
                              child: Text('Last 3 months')),
                          DropdownMenuItem(
                              value: 'Custom range',
                              child: Text('Custom range')),
                        ],
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Student',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      DropdownButtonFormField(
                        value: 'All Students',
                        items: const [
                          DropdownMenuItem(
                              value: 'All Students',
                              child: Text('All Students')),
                          DropdownMenuItem(
                              value: 'Student 1', child: Text('Student 1')),
                          DropdownMenuItem(
                              value: 'Student 2', child: Text('Student 2')),
                          DropdownMenuItem(
                              value: 'Student 3', child: Text('Student 3')),
                        ],
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Status',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      DropdownButtonFormField(
                        value: 'All Statuses',
                        items: const [
                          DropdownMenuItem(
                              value: 'All Statuses',
                              child: Text('All Statuses')),
                          DropdownMenuItem(
                              value: 'At Risk', child: Text('At Risk')),
                          DropdownMenuItem(
                              value: 'Needs Follow-up',
                              child: Text('Needs Follow-up')),
                          DropdownMenuItem(
                              value: 'Normal', child: Text('Normal')),
                        ],
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Apply Filters'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Reports Table
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('St. No.')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Feeling anxious')),
                  DataColumn(label: Text('Friends anxious')),
                  DataColumn(label: Text('Feeling depressed')),
                  DataColumn(label: Text('Felt at peace')),
                  DataColumn(label: Text('Able to share')),
                  DataColumn(label: Text('Information')),
                ],
                rows: _reports.map((report) {
                  return DataRow(cells: [
                    DataCell(Text(report['id'].toString())),
                    DataCell(Text(report['date'])),
                    DataCell(_buildStatusChip(report['anxious'])),
                    DataCell(_buildStatusChip(report['friendsAnxious'])),
                    DataCell(_buildStatusChip(report['depressed'])),
                    DataCell(_buildStatusChip(report['atPeace'])),
                    DataCell(_buildStatusChip(report['shareFeelings'])),
                    DataCell(_buildStatusChip(report['information'])),
                  ]);
                }).toList(),
              ),
            ),

            const SizedBox(height: 24),

            // Pagination
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: _currentPage > 0
                      ? () {
                          setState(() {
                            _currentPage--;
                          });
                        }
                      : null,
                ),
                ...List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: _currentPage == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: _currentPage < 2
                      ? () {
                          setState(() {
                            _currentPage++;
                          });
                        }
                      : null,
                ),
              ],
            ),
          ],
        ),
      ),

      // Navigation Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'U View',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              selected: true,
              selectedTileColor: Colors.blue[100],
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.assessment),
              title: const Text('Reports'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Students'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Analytics'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
      String title, String value, String subtitle, Color color) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case 'Slightly':
        backgroundColor = Colors.orange[50]!;
        textColor = Colors.orange[800]!;
        break;
      case 'Not at All':
        backgroundColor = Colors.green[50]!;
        textColor = Colors.green[800]!;
        break;
      default: // N/A
        backgroundColor = Colors.grey[200]!;
        textColor = Colors.grey[800]!;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
        ),
      ),
    );
  }
}
