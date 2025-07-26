import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/cubit/woundClinic_cubit.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/model/wound_describe_report_model.dart';

class WoundManagementScreen extends StatefulWidget {
  const WoundManagementScreen({Key? key}) : super(key: key);

  @override
  State<WoundManagementScreen> createState() => _WoundManagementScreenState();
}

class _WoundManagementScreenState extends State<WoundManagementScreen> {
  @override
  void initState() {
    context.read<WoundClinicCubit>().getWoundDescReport();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WoundClinicCubit, WoundClinicState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Wound Management Report',
                style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true,
            elevation: 0,
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.teal.shade50, Colors.grey.shade100],
              ),
            ),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount:
                  (state.woundDescribeReportModel?.woundDescribe ?? []).length,
              separatorBuilder: (_, __) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                final wound = (state.woundDescribeReportModel?.woundDescribe ??
                    [])[index];
                return _buildWoundCard(wound);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildWoundCard(WoundDescribe wound) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: AppColors.kPrimaryColor, width: 8),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section (always visible)
              Padding(
                padding: const EdgeInsets.all(16),
                child: _buildHeaderSection(wound),
              ),

              // Expandable management section
              ExpandableManagementSection(management: wound.management ?? []),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection(WoundDescribe wound) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildInfoChip('Date', _formatDate(wound.date.toString())),
            const SizedBox(width: 8),
            _buildInfoChip('Type', wound.patternOfWound ?? ""),
          ],
        ),
        const SizedBox(height: 12),
        _buildInfoRow('Assessment: ', wound.id.toString() ?? ""),
        _buildInfoRow('Location', wound.location ?? ""),
        _buildInfoRow('Site', wound.site ?? ""),
        _buildInfoRow('First Occurred', wound.occured ?? ""),
      ],
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$title:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String label, String value) {
    return Chip(
      backgroundColor: AppColors.kPrimaryColor.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: AppColors.kPrimaryColor),
      ),
      label: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$label: ',
              style: TextStyle(
                color: AppColors.kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(color: AppColors.kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String inputDate) {
    try {
      final parsed = DateTime.parse(inputDate);
      return DateFormat('MMM dd, yyyy').format(parsed);
    } catch (e) {
      return inputDate;
    }
  }
}

class ExpandableManagementSection extends StatefulWidget {
  final List<Management> management;

  const ExpandableManagementSection({
    Key? key,
    required this.management,
  }) : super(key: key);

  @override
  State<ExpandableManagementSection> createState() =>
      _ExpandableManagementSectionState();
}

class _ExpandableManagementSectionState
    extends State<ExpandableManagementSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Expand/collapse button
        InkWell(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isExpanded
                      ? 'HIDE MANAGEMENT DETAILS'
                      : 'VIEW MANAGEMENT DETAILS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.kPrimaryColor,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: AppColors.kPrimaryColor,
                  size: 20,
                ),
              ],
            ),
          ),
        ),

        // Expandable content
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: _isExpanded ? _buildManagementList() : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildManagementList() {
    if (widget.management.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            'No management records found',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Management History',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.kPrimaryColor,
            ),
          ),
          const SizedBox(height: 16),
          ...widget.management.map((entry) => _buildManagementCard(entry)),
        ],
      ),
    );
  }

  Widget _buildManagementCard(Management entry) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header row with dates
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor.withOpacity(0.05),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDateItem('Date', _formatDate(entry.date ?? "")),
                _buildDateItem(
                    'Next Review', _formatDate(entry.nextDate ?? "")),
              ],
            ),
          ),

          // Details grid
          Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 3,
              children: [
                _buildDetailItem('Debridement', entry.debridement ?? ""),
                _buildDetailItem('Solution', entry.solution ?? ""),
                _buildDetailItem('Product Used', entry.productUsed ?? ""),
                _buildDetailItem('Frequency', entry.frequency ?? ""),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  String _formatDate(String inputDate) {
    try {
      final parsed = DateTime.parse(inputDate);
      return DateFormat('MMM dd, yyyy').format(parsed);
    } catch (e) {
      return inputDate;
    }
  }
}
