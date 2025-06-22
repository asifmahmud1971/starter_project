import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_date_time_formatter.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/core/utils/extension.dart';
import 'package:medPilot/features/patient_portal/home/widgets/medication_card.dart';
import 'package:medPilot/features/patient_portal/services/cubit/services_cubit.dart';
import 'package:medPilot/features/staff_portal/pescription/cubit/staff_prescription_cubit.dart';
import 'package:medPilot/features/staff_portal/pescription/widget/patient_dropdown.dart';

class StaffPrescriptionScreen extends StatefulWidget {
  const StaffPrescriptionScreen({super.key});

  @override
  State<StaffPrescriptionScreen> createState() =>
      _StaffPrescriptionScreenState();
}

class _StaffPrescriptionScreenState extends State<StaffPrescriptionScreen> {
  @override
  void initState() {
    context.read<StaffPrescriptionCubit>().resetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StaffPrescriptionCubit, StaffPrescriptionState>(
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
          body: BlocBuilder<StaffPrescriptionCubit, StaffPrescriptionState>(
            builder: (context, state) {
              return Column(
                children: [
                  AnimatedPatientDropdown(),
                 state.staffPrescription==null? Center(child: Text("No patient selected"),)
                  :Expanded(
                    child: Visibility(
                      visible: state.staffPrescription?.patient!=null,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor
                                    .withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.staffPrescription?.patient?.name ?? "",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  8.verticalSpace,
                                  Row(
                                    children: [
                                      Icon(Icons.cake,
                                          color: Colors.black, size: 16),
                                      8.horizontalSpace,
                                      Text(
                                        '${state.staffPrescription?.patient?.age} ${AppStrings.years.tr()} • ${state.staffPrescription?.patient?.gender}',
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
                                        '${state.staffPrescription?.patient?.mobile}',
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
                                        '${state.staffPrescription?.patient?.consultingDoctor}',
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
                                        "${AppStrings.lastUpdate.tr()}: ${state.staffPrescription?.patient?.updatedAt?.toFormattedDateTime}",
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
                                style: kBodySmall.copyWith(
                                    color: AppColors.kGrayColor500),
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
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: (state.staffPrescription?.prescriptions?.medicine ?? [])
                                  .length,
                              itemBuilder: (context, index) {
                                return MedicationCard(
                                  icon: Icons.medication,
                                  iconColor: Colors.blue,
                                  title: state.staffPrescription?.prescriptions?.medicine?[index]
                                          .medicine?.medicineName ??
                                      "",
                                  subtitle: state.staffPrescription?.prescriptions?.medicine?[index]
                                          .medicine
                                          ?.medicineIngredients ??
                                      "",
                                  dose: state.staffPrescription?.prescriptions?.medicine?[index]
                                          .dose ??
                                      "",
                                  note: state.staffPrescription?.prescriptions?.medicine?[index].note,
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return 10.verticalSpace;
                              },
                            ),

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
                                          size: 18.r,
                                          color: AppColors.kPrimaryColor),
                                      6.horizontalSpace,
                                      Text(
                                        state.staffPrescription?.patient
                                                ?.doctorContractNumber ??
                                            "",
                                        style: kBodyMedium.copyWith(
                                            color: AppColors.kBlackColor),
                                      ),
                                      16.horizontalSpace,
                                      Icon(Icons.email_outlined,
                                          size: 18.r,
                                          color: AppColors.kPrimaryColor),
                                      6.horizontalSpace,
                                      Text(
                                        state.staffPrescription?.patient?.email ??
                                            "",
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
                                          size: 18.r,
                                          color: AppColors.kPrimaryColor),
                                      6.horizontalSpace,
                                      Text(
                                        'Dhaka, Bangladesh',
                                        style: kBodyMedium.copyWith(
                                            color: AppColors.kBlackColor),
                                      ),
                                      16.horizontalSpace,
                                      Icon(Icons.language,
                                          size: 18.r,
                                          color: AppColors.kPrimaryColor),
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

                            20.verticalSpace
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
