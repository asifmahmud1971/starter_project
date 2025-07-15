import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/cubit/onDemand_service_cubit.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/widget/service_product_card.dart';

class HomeVisitPage extends StatefulWidget {
  const HomeVisitPage({super.key});

  @override
  State<HomeVisitPage> createState() => _HomeVisitPageState();
}

class _HomeVisitPageState extends State<HomeVisitPage> {

  @override
  void initState() {
    context.read<OnDemandServiceCubit>().getHomeVisit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnDemandServiceCubit, OnDemandServiceState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.homeVisit.tr(),
              style: kTitleMedium.copyWith(color: Colors.white),
            ),
            backgroundColor: AppColors.kPrimaryColor,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: ListView.separated(
            padding: EdgeInsets.all(16.r),
            itemCount: (state.onService?.product??[]).length,
            itemBuilder: (context, index) {
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
