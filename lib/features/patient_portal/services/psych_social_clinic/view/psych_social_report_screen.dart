import 'package:flutter/material.dart';

class PsychoSocialReportPage extends StatelessWidget {
  final List<Map<String, String>> reportData = [
    {
      "date": "27-05-2025",
      "anxious": "Slightly",
      "friendsAnxious": "Not at All",
      "depressed": "Not at All",
      "peace": "Not at All",
      "shareFeelings": "Not at All",
      "info": "Not at All",
    },
    {
      "date": "08-05-2025",
      "anxious": "a",
      "friendsAnxious": "a",
      "depressed": "a",
      "peace": "a",
      "shareFeelings": "a",
      "info": "a",
    },
    {
      "date": "08-05-2025",
      "anxious": "a",
      "friendsAnxious": "a",
      "depressed": "a",
      "peace": "a",
      "shareFeelings": "a",
      "info": "a",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Psycho Social Report')),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('SL No.')),
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Feeling anxious or worried')),
            DataColumn(label: Text('Friends anxious or worried')),
            DataColumn(label: Text('Feeling depressed?')),
            DataColumn(label: Text('Felt at peace?')),
            DataColumn(label: Text('Able to share feelings')),
            DataColumn(label: Text('Much information')),
          ],
          rows: List<DataRow>.generate(
            reportData.length,
                (index) {
              final item = reportData[index];
              return DataRow(cells: [
                DataCell(Text('${index + 1}')),
                DataCell(Text(item['date'] ?? '')),
                DataCell(Text(item['anxious'] ?? '')),
                DataCell(Text(item['friendsAnxious'] ?? '')),
                DataCell(Text(item['depressed'] ?? '')),
                DataCell(Text(item['peace'] ?? '')),
                DataCell(Text(item['shareFeelings'] ?? '')),
                DataCell(Text(item['info'] ?? '')),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
