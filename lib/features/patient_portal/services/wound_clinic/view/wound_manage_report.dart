import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';

class WoundManagementScreen extends StatefulWidget {
  @override
  _WoundManagementScreenState createState() => _WoundManagementScreenState();
}

class _WoundManagementScreenState extends State<WoundManagementScreen> {
  final List<WoundRecord> _woundRecords = [
    WoundRecord(
      location: 'iyyy',
      site: 'iyy',
      firstOccurred: 'iy',
      woundType: 'Burn',
      date: DateTime(2025, 5, 8),
      debridement: 'iy',
      cleaningSolution: 'USOL',
      productUsed: 'iy',
      dressingFrequency: 'iy',
      nextReviewDate: DateTime(2025, 5, 8),
    ),
    WoundRecord(
      location: 'dih',
      site: 'fdhg',
      firstOccurred: 'fdghf',
      woundType: 'Bed Sore',
      date: DateTime(2025, 5, 8),
      debridement: 'fdgh',
      cleaningSolution: 'USOL',
      productUsed: 'elsg',
      dressingFrequency: 'diyhdiyhg ghjfg tfgdsd',
      nextReviewDate: DateTime(2025, 5, 9),
    ),
    WoundRecord(
      date: DateTime(2025, 5, 8),
      debridement: 'ghjhf',
      cleaningSolution: 'normal saline',
    ),
    WoundRecord(
      date: DateTime(2025, 5, 8),
      debridement: 'fdgh',
      cleaningSolution: 'USOL',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text(AppStrings.woundManagementReport.tr(),
          style: kTitleMedium.copyWith(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFFFF904D),
        // Your primary color
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSummaryCard(),
            20.verticalSpace,
            ..._woundRecords.map((record) => _buildWoundCard(record)).toList(),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [AppColors.kBackGroundShadow],borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.woundSummery.tr(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF904D),
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                _buildSummaryItem(
                    AppStrings.totalWounds.tr(), _woundRecords.length.toString()),
                _buildSummaryItem(AppStrings.activeCases.tr(), '2'),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                _buildSummaryItem(AppStrings.burns.tr(), '1'),
                _buildSummaryItem(AppStrings.bedSores.tr(    ), '1'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWoundCard(WoundRecord record) {
    final dateFormat = DateFormat('MM/dd/yyyy');

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [AppColors.kBackGroundShadow],borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (record.woundType != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    record.woundType!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF904D),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getWoundColor(record.woundType!).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _getWoundColor(record.woundType!),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      record.woundType!,
                      style: TextStyle(
                        color: _getWoundColor(record.woundType!),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              _buildDetailRow('${AppStrings.location.tr()}:', record.location ?? 'Not specified'),
              _buildDetailRow('${AppStrings.site.tr()}:', record.site ?? 'Not specified'),
              _buildDetailRow(
                  '${AppStrings.firstOccurred.tr()}:', record.firstOccurred ?? 'Not specified'),
              Divider(height: 24),
            ],
            _buildDetailRow('${AppStrings.date.tr()}:', dateFormat.format(record.date)),
            _buildDetailRow('${AppStrings.debridement.tr()}:', record.debridement),
            _buildDetailRow('${AppStrings.cleaningSolution.tr()}:', record.cleaningSolution),
            if (record.productUsed != null)
              _buildDetailRow('${AppStrings.productUsed.tr()}:', record.productUsed!),
            if (record.dressingFrequency != null)
              _buildDetailRow('${AppStrings.dressingFrequency.tr()}:', record.dressingFrequency!),
            if (record.nextReviewDate != null)
              _buildDetailRow(
                  '${AppStrings.nextReview.tr()}:', dateFormat.format(record.nextReviewDate!)),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Color _getWoundColor(String type) {
    switch (type.toLowerCase()) {
      case 'burn':
        return Colors.orange;
      case 'bed sore':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}

class WoundRecord {
  final String? location;
  final String? site;
  final String? firstOccurred;
  final String? woundType;
  final DateTime date;
  final String debridement;
  final String cleaningSolution;
  final String? productUsed;
  final String? dressingFrequency;
  final DateTime? nextReviewDate;

  WoundRecord({
    this.location,
    this.site,
    this.firstOccurred,
    this.woundType,
    required this.date,
    required this.debridement,
    required this.cleaningSolution,
    this.productUsed,
    this.dressingFrequency,
    this.nextReviewDate,
  });
}