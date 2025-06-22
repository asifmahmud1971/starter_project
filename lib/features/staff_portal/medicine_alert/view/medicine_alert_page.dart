import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/cubit/medicine_alert_cubit.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/widget/header_widget.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/widget/medicine_card_widget.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/widget/status_summery_widget.dart';

class MedicineAlertScreen extends StatefulWidget {
  const MedicineAlertScreen({super.key});

  @override
  State<MedicineAlertScreen> createState() => _MedicineAlertScreenState();
}

class _MedicineAlertScreenState extends State<MedicineAlertScreen> {
  @override
  void initState() {
    context.read<MedicineAlertCubit>().getMedicineAlertData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineAlertCubit, MedicineAlertState>(
      builder: (context, state) {
        final alerts = state.medicineAlertModel?.alerts ?? [];
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.todayMedicineAlert.tr()),
          ),
          body: Column(
            children: [
              const HeaderWidget(),
              16.verticalSpace,
              StatusSummaryWidget(alerts: alerts),
             16.verticalSpace,
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: alerts.length,
                  itemBuilder: (context, index) {
                    return MedicineCardWidget(alert: alerts[index]);
                  }, separatorBuilder: (BuildContext context, int index) { return 16.verticalSpace; },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}










