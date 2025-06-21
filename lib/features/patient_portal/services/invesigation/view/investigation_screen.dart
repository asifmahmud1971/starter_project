import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/services/invesigation/cubit/investigation_cubit.dart';
import 'package:medPilot/features/patient_portal/services/invesigation/shimmer/patient_info_shimmer.dart';
import 'package:medPilot/features/patient_portal/services/invesigation/widgets/patient_information.dart';

class InvestigationReportScreen extends StatefulWidget {
  const InvestigationReportScreen({super.key});

  @override
  State<InvestigationReportScreen> createState() =>
      _InvestigationReportScreenState();
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
        title: Text(
          AppStrings.investigationReport.tr(),
          style: kTitleLarge.copyWith(color: AppColors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor,
        iconTheme: IconThemeData(color: AppColors.white),
        elevation: 0,
      ),
      body: BlocBuilder<InvestigationCubit, InvestigationState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.patientInformation.tr(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                12.verticalSpace,
                state.investigationsResponse?.patientInfo!=null?PatientInformation(patientInfo: state.investigationsResponse?.patientInfo):PatientInfoShimmer(),
                20.verticalSpace,
                Text(
                  AppStrings.diagnosisReport.tr(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                12.verticalSpace,
                ...?state.investigationsResponse?.investigations?.map(
                  (test) => _buildTestCard(
                    date: test.date ?? "",
                    category: test.category ?? "",
                    result: test.result ?? "",
                    range: test.range ?? "",
                    unit: test.unit ?? "",
                    type: test.type ?? "",
                  ),
                ),
                20.verticalSpace,
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
          );
        },
      ),
    );
  }

  Widget _buildTestCard({
    required String date,
    required String category,
    required String result,
    required String range,
    required String unit,
    required String type,
  }) {
    bool isAbnormal = range.isNotEmpty &&
        !result.contains(range); // Logic to detect abnormal results

    return Container(
      decoration: AppColors.kDecoration,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row (Date + Abnormal Flag)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              if (isAbnormal)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red),
                  ),
                  child: Text(
                    'Abnormal',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 12),

          // Test Details
          _buildDetailRow('Test', category),
          _buildDetailRow('Result', '$result $unit', isBold: true),
          _buildDetailRow('Range', range, isBold: true),
          if (range.isNotEmpty) _buildDetailRow('Normal Range', range),

          // Doctor Input Tag
          if (type == 'doctor-input')
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Icon(Icons.medical_services, size: 16, color: Colors.blue),
                  SizedBox(width: 4),
                  Text(
                    'Doctor Input',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Helper Widget: Detail Row
  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


