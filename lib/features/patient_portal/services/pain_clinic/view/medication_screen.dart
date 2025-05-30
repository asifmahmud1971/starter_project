import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/cubit/painClinic_cubit.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/medication_model.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/view/medication_screen_dialog.dart';

class MedicationScreen extends StatefulWidget {
  @override
  _MedicationScreenState createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {

  int _expandedIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    context.read<PainClinicCubit>().getPainMedication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PainClinicCubit, PainClinicState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFFF8F9FA),
          appBar: AppBar(
            title: Text(AppStrings.medication.tr(), style: kTitleMedium),
            elevation: 0,
          ),
          body: ListView.builder(
            padding: EdgeInsets.only(bottom: 16),
            itemCount: state.medicationModel?.painMedications?.length,
            itemBuilder: (context, index) {
              return _buildMedicationCard(index);
            },
          ),
          /*  floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.kPrimaryColor,
        child: Icon(Icons.add, size: 28),
        onPressed: _addNewMedication,
      ),*/
        );
      },
    );
  }

  Widget _buildMedicationCard(int index) {
    return BlocBuilder<PainClinicCubit, PainClinicState>(
      builder: (context, state) {
        final med = state.medicationModel?.painMedications?[index];
        final isExpanded = _expandedIndex == index;
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey[200]!, width: 1),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () =>
                setState(() {
                  _expandedIndex = isExpanded ? -1 : index;
                }),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        med?.name??"",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          med?.duration??"",
                          style: TextStyle(
                            color: AppColors.kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  _buildDetailRow('${AppStrings.dosage.tr()}:', med?.dose??""),
                  _buildDetailRow(
                      '${AppStrings.instructions.tr()}:', med?.note??""),
                  SizedBox(height: 8),
                  if (isExpanded) ...[
                    Divider(height: 24, thickness: 1),
                    Text(
                      AppStrings.doseSchedule.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 12),
                    ...(med?.chart??[]).map<Widget>((schedule) {
                      return _buildScheduleItem(
                        schedule.date??"",
                        schedule.time??"",
                        schedule.taken == "Yes",
                        schedule.id??0
                      );
                    }).toList(),
                    /* SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor,
                          side: BorderSide(color: AppColors.kPrimaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {},
                        child: Text('Edit Medication'),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {},
                        child: Text('Add Dose'),
                      ),
                    ),
                  ],
                ),*/
                  ],
                  if (!isExpanded) ...[
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppStrings.tapToViewSchedule.tr(),
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleItem(String date, String time, bool taken,int id) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: taken ? Colors.green[50] : Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: taken ? Colors.green[100]! : Colors.grey[200]!,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: taken ? Colors.green : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: taken ? Colors.green : Colors.grey[300]!,
              ),
            ),
            child: Icon(
              taken ? Icons.check : Icons.access_time,
              color: taken ? Colors.white : AppColors.kPrimaryColor,
              size: 20,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('MMM dd, yyyy').format(DateTime.parse(date)),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          Spacer(),
          if (!taken)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              onPressed: () {
                context.read<PainClinicCubit>().givenMedicine(id.toString(),_expandedIndex);
              },
              child: Text(AppStrings.markTaken.tr()),
            ),
        ],
      ),
    );
  }


  void _addNewMedication() {
    showDialog(
      context: context,
      builder: (context) {
        return MedicationScreen();
      },
    );
  }
}
