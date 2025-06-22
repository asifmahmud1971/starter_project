import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:medPilot/core/components/custom_image.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/cubit/onDemand_service_cubit.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/product.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/widget/service_product_card.dart';


class ProcedurePage extends StatefulWidget {
  const ProcedurePage({super.key});

  @override
  State<ProcedurePage> createState() => _ProcedurePageState();
}

class _ProcedurePageState extends State<ProcedurePage> {
  @override
  void initState() {
    context.read<OnDemandServiceCubit>().getProcedure();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnDemandServiceCubit, OnDemandServiceState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.procedure.tr(),
              style: kTitleMedium.copyWith(color: Colors.white),
            ),
            backgroundColor: AppColors.kPrimaryColor,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: ListView.separated(
            padding: EdgeInsets.all(16.r),
            itemCount: (state.onService?.product??[]).length,
            itemBuilder: (context, index) {
              log("message ${(state.onService?.product??[]).length}");
              return ServiceProductCard(
                service: state.onService?.product?[index],
                onAddToCart: () {},
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return 10.verticalSpace;
            },
          ),
        );
      },
    );
  }
}




