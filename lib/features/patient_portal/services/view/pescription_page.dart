import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_date_time_formatter.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/core/utils/extension.dart';
import 'package:medPilot/features/patient_portal/services/cubit/services_cubit.dart';
import 'package:medPilot/features/patient_portal/services/pescription/widget/set_alert_bottom_sheet.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  @override
  void initState() {
    context.read<ServiceCubit>().getPrescription();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceCubit, ServiceState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.prescription.tr()),
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Center(
                  child: Text(
                    DateTime.now().toNameDate,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Patient Info Container
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.prescriptionModel?.patient?.name ?? "",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          const Icon(Icons.cake, color: Colors.black, size: 16),
                          8.horizontalSpace,
                          Text(
                            '${state.prescriptionModel?.patient?.age} ${AppStrings.years.tr()} • ${state.prescriptionModel?.patient?.gender}',
                            style: kBodyMedium,
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          const Icon(Icons.phone,
                              color: Colors.black, size: 16),
                          8.horizontalSpace,
                          Text(
                            state.prescriptionModel?.patient?.mobile ?? "",
                            style: kBodyMedium,
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          const Icon(Icons.medical_services,
                              color: Colors.black, size: 16),
                          8.horizontalSpace,
                          Text(
                            state.prescriptionModel?.patient
                                    ?.consultingDoctor ??
                                "",
                            style: kBodyMedium,
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          const Icon(Icons.access_time,
                              color: Colors.black, size: 16),
                          8.horizontalSpace,
                          Text(
                            "${AppStrings.lastUpdate.tr()}: ${state.prescriptionModel?.patient?.updatedAt?.toFormattedDateTime}",
                            style: kBodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                24.verticalSpace,

                // Diagnosis Section
                Text(
                  AppStrings.diagnosis.tr(),
                  style: kTitleLarge,
                ),
                8.verticalSpace,
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    AppStrings.noDiagnosisNotes.tr(),
                    style: kBodySmall.copyWith(color: AppColors.kGrayColor500),
                  ),
                ),
                24.verticalSpace,

                // Medications Section
                Text(
                  AppStrings.medications.tr(),
                  style: kTitleLarge,
                ),
                16.verticalSpace,
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.prescriptionModel?.medicine?.length ?? 0,
                  itemBuilder: (context, index) {
                    final medicine = state.prescriptionModel!.medicine![index];
                    return MedicationCard(
                      icon: Icons.medication,
                      iconColor: Colors.blue,
                      title: medicine.medicine?.medicineName ?? "",
                      subtitle: medicine.medicine?.medicineIngredients ?? "",
                      dose: medicine.dose ?? "",
                      note: medicine.note,
                      duration: medicine.duration ?? "",
                      onSetAlert: () => _showAlarmSettings(
                        context,
                        medicine.medicine?.medicineName ?? "",
                        medicine.duration ?? "",
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return 10.verticalSpace;
                  },
                ),

                // Advice Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.advice.tr(),
                      style: kTitleLarge,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      child: Text(
                        AppStrings.noAdditionalAdvice.tr(),
                        style: kBodyMedium.copyWith(
                            color: AppColors.kGrayColor500),
                      ),
                    ),
                  ],
                ),
                24.verticalSpace,

                // Hospital Info
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call,
                              size: 18.r, color: AppColors.kPrimaryColor),
                          6.horizontalSpace,
                          Text(
                            state.prescriptionModel?.patient
                                    ?.doctorContractNumber ??
                                "",
                            style: kBodyMedium.copyWith(
                                color: AppColors.kBlackColor),
                          ),
                          16.horizontalSpace,
                          Icon(Icons.email_outlined,
                              size: 18.r, color: AppColors.kPrimaryColor),
                          6.horizontalSpace,
                          Text(
                            state.prescriptionModel?.patient?.email ?? "",
                            style: kBodyMedium.copyWith(
                                color: AppColors.kBlackColor),
                          ),
                        ],
                      ),
                      12.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on_outlined,
                              size: 18.r, color: AppColors.kPrimaryColor),
                          6.horizontalSpace,
                          Text(
                            'Dhaka, Bangladesh',
                            style: kBodyMedium.copyWith(
                                color: AppColors.kBlackColor),
                          ),
                          16.horizontalSpace,
                          Icon(Icons.language,
                              size: 18.r, color: AppColors.kPrimaryColor),
                          6.horizontalSpace,
                          Text(
                            'www.medpilot.app',
                            style: kBodyMedium.copyWith(
                                color: AppColors.kBlackColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAlarmSettings(
      BuildContext context, String medicineName, String duration) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AlarmSettingsBottomSheet(
        medicineName: medicineName,
        duration: duration,
      ),
    );
  }
}





class MedicationCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String dose;
  final String? note;
  final String duration;
  final VoidCallback onSetAlert;

  const MedicationCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.dose,
    this.note,
    required this.duration,
    required this.onSetAlert,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor, size: 24.r),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: kBodyLarge.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        subtitle,
                        style: kBodySmall.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                // Set Alert Button
                _buildSetAlertButton(),
              ],
            ),
            12.verticalSpace,
            Row(
              children: [
                _buildInfoChip(
                  icon: Icons.medical_information,
                  label: 'Dose: $dose',
                ),
                8.horizontalSpace,
                _buildInfoChip(
                  icon: Icons.schedule,
                  label: duration,
                ),
              ],
            ),
            if (note != null && note!.isNotEmpty) ...[
              8.verticalSpace,
              Text(
                'Note: $note',
                style: kBodySmall.copyWith(color: AppColors.kGrayColor700),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildSetAlertButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: IconButton(
        icon: Icon(Icons.notifications_active,
            size: 20.r, color: AppColors.kPrimaryColor),
        onPressed: onSetAlert,
        tooltip: 'Set Alert',
      ),
    );
  }

  Widget _buildInfoChip({required IconData icon, required String label}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.r, color: Colors.grey),
          4.horizontalSpace,
          Text(
            label,
            style: kBodySmall,
          ),
        ],
      ),
    );
  }
}
