import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PsychoSocialReportPage extends StatelessWidget {
  final List<PsychoSocialRecord> records = [
    PsychoSocialRecord(
      date: DateTime(2025, 5, 27),
      feelingAnxious: 'Slightly',
      friendsAnxious: 'Not at All',
      feelingDepressed: 'Not at All',
      feltAtPeace: 'Not at All',
      ableToShare: 'Not at All',
      muchInformation: 'Not at All',
    ),
    PsychoSocialRecord(
      date: DateTime(2025, 5, 8),
      feelingAnxious: 'a',
      friendsAnxious: 'a',
      feelingDepressed: 'a',
      feltAtPeace: 'a',
      ableToShare: 'a',
      muchInformation: 'a',
    ),
    PsychoSocialRecord(
      date: DateTime(2025, 5, 8),
      feelingAnxious: 'a',
      friendsAnxious: 'a',
      feelingDepressed: 'a',
      feltAtPeace: 'a',
      ableToShare: 'a',
      muchInformation: 'a',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('Psycho Social Report'),
        centerTitle: true,
        backgroundColor: Color(0xFFFF904D), // Your primary color
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: Column(
        children: [
          // Summary Section
          _buildSummaryCard(),

          // Records List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: records.length,
              itemBuilder: (context, index) {
                return _buildRecordCard(records[index], index + 1);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF904D),
        child: Icon(Icons.add),
        onPressed: () {
          // Add new record
        },
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Emotional Well-being Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF904D),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryItem('Positive Days', '12', Icons.sentiment_satisfied_alt),
                _buildSummaryItem('Neutral Days', '5', Icons.sentiment_neutral),
                _buildSummaryItem('Challenging Days', '3', Icons.sentiment_dissatisfied),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFFF904D).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Color(0xFFFF904D),
            size: 30,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildRecordCard(PsychoSocialRecord record, int slNo) {
    final dateFormat = DateFormat('dd MMM yyyy');

    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Record #$slNo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dateFormat.format(record.date),
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Divider(height: 1),
            SizedBox(height: 12),
            _buildEmotionRow('Feeling anxious or worried:', record.feelingAnxious),
            _buildEmotionRow('Friends anxious or worried:', record.friendsAnxious),
            _buildEmotionRow('Feeling depressed:', record.feelingDepressed),
            _buildEmotionRow('Felt at peace:', record.feltAtPeace),
            _buildEmotionRow('Able to share feelings:', record.ableToShare),
            _buildEmotionRow('Much information:', record.muchInformation),
          ],
        ),
      ),
    );
  }

  Widget _buildEmotionRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: _getResponseColor(value),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getResponseColor(String response) {
    switch (response.toLowerCase()) {
      case 'not at all':
        return Colors.green;
      case 'slightly':
        return Colors.lightGreen;
      case 'somewhat':
        return Colors.orange;
      case 'very much':
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }
}

class PsychoSocialRecord {
  final DateTime date;
  final String feelingAnxious;
  final String friendsAnxious;
  final String feelingDepressed;
  final String feltAtPeace;
  final String ableToShare;
  final String muchInformation;

  PsychoSocialRecord({
    required this.date,
    required this.feelingAnxious,
    required this.friendsAnxious,
    required this.feelingDepressed,
    required this.feltAtPeace,
    required this.ableToShare,
    required this.muchInformation,
  });
}