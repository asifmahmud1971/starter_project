import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/cubit/woundClinic_cubit.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/model/wound_data.dart';

class WoundAssessmentScreen extends StatefulWidget {
  const WoundAssessmentScreen({super.key});

  @override
  State<WoundAssessmentScreen> createState() => _WoundAssessmentScreenState();
}

class _WoundAssessmentScreenState extends State<WoundAssessmentScreen> {


  @override
  void initState() {
    context.read<WoundClinicCubit>().getAllWoundAssessment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WoundClinicCubit, WoundClinicState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Wound Assessment History')),
          body: state.allWoundData!=null?ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: state.allWoundData?.woundAssessment?.length,
            itemBuilder: (context, index) {
              WoundData? assessment =
                  state.allWoundData?.woundAssessment?.elementAt(index);
              return Container(
                decoration: AppColors.kDecoration,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(assessment?.date ?? ""),
                      const SizedBox(height: 12),
                      if (assessment?.image != null)
                        GestureDetector(
                          onTap: () => _showFullImage(
                              context, assessment?.image ?? ""),
                          child: Container(
                            width: 1.sw,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                image:
                                NetworkImage(assessment?.image ?? ""),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 12),
                      _buildMeasurementTable(assessment),
                      const SizedBox(height: 12),
                      _buildAppearanceSection(assessment),
                      const SizedBox(height: 12),
                      _buildExudateTable(assessment),
                    ],
                  ),
                ),
              );
            },
          ):SizedBox.shrink(),
        );
      },
    );
  }

  void _showFullImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 0.5,
          maxScale: 3.0,
          child: Image.network(imagePath),
        ),
      ),
    );
  }

  Widget _buildHeader(String date) {
    return Text('Assessment: $date',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }

  Widget _buildMeasurementTable(WoundData? assessment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Measurement (cm/mm)',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Table(
          columnWidths: const {0: FlexColumnWidth(1.5), 1: FlexColumnWidth(2)},
          border: TableBorder.all(color: Colors.grey.shade300),
          children: [
            _buildTableRow(['Wound Stage', assessment?.woundStage ?? ""]),
            _buildTableRow(['Wound Size', assessment?.width ?? ""]),
            _buildTableRow(['Length', assessment?.length ?? ""]),
            _buildTableRow(['Depth', assessment?.depth ?? ""]),
            _buildTableRow(['Edges', assessment?.edges ?? ""]),
            _buildTableRow(['Exposed', assessment?.exposed ?? ""]),
            _buildTableRow(['Smell', assessment?.smell ?? ""]),
            _buildTableRow(['Infection', assessment?.infection ?? ""]),
            if (assessment?.infection == 'Present')
              _buildTableRow(['Type', assessment?.type ?? ""]),
          ],
        ),
      ],
    );
  }

  Widget _buildAppearanceSection(WoundData? assessment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Appearance of wound',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(assessment?.appearance ?? ""),
        const SizedBox(height: 12),
        const Text('Appearance of wound %',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text("0"),
      ],
    );
  }

  Widget _buildExudateTable(WoundData? assessment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Exudate', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Table(
          columnWidths: const {0: FlexColumnWidth(1.5), 1: FlexColumnWidth(2)},
          border: TableBorder.all(color: Colors.grey.shade300),
          children: [
            _buildTableRow(['Amount', assessment?.exudateAmount ?? ""]),
            _buildTableRow(['Nature', assessment?.exudateNature ?? ""]),
            _buildTableRow(['Odour', assessment?.odour ?? ""]),
            _buildTableRow(['Color', assessment?.color ?? ""]),
            _buildTableRow(['Pain Score', assessment?.painScore ?? ""]),
            _buildTableRow(['Exudate Pain', assessment?.exudateNature ?? ""]),
          ],
        ),
      ],
    );
  }

  TableRow _buildTableRow(List<String> cells) {
    return TableRow(
      children: cells.map((text) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Text(text),
        );
      }).toList(),
    );
  }
}


