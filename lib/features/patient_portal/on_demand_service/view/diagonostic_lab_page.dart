import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/cubit/onDemand_service_cubit.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/product.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/widget/lab_report_card.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/widget/service_product_card.dart';

import '../../../../core/constants/app_text_style.dart';

class DiagnosticLabPage extends StatefulWidget {
  const DiagnosticLabPage({super.key});

  @override
  State<DiagnosticLabPage> createState() => _DiagnosticLabPageState();
}

class _DiagnosticLabPageState extends State<DiagnosticLabPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<OnDemandServiceCubit>().getLab();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnDemandServiceCubit, OnDemandServiceState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.diagnosticLab.tr(),
              style: kTitleMedium.copyWith(color: Colors.white),
            ),
            backgroundColor: AppColors.kPrimaryColor,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: ListView.builder(
            padding: EdgeInsets.all(16.r),

            itemCount: (state.onService?.product??[]).length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: LabReportCardWidget(
                  service: state.onService?.product?[index],
                  onAddToCart: () {},
                ),
              );
            },
          ),
        );
      },
    );
  }
}
