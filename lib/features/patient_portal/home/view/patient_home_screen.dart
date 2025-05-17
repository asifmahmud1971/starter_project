import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/common_background.dart';
import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/home/cubit/home_cubit.dart';
import 'package:medPilot/features/patient_portal/home/helper/dummy_slider_list.dart';
import 'package:medPilot/features/patient_portal/home/model/service_model.dart';
import 'package:medPilot/features/patient_portal/home/view/blog_list.dart';
import 'package:medPilot/features/patient_portal/home/view/service_list.dart';
import 'package:medPilot/features/patient_portal/home/widgets/app_slider.dart';
import 'package:medPilot/features/patient_portal/home/widgets/call_card.dart';
import 'package:medPilot/features/patient_portal/home/widgets/top_bar.dart';
import 'package:medPilot/generated/assets.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  int selectedTabIndex = 0;

  @override
  void initState() {
    context.read<HomeCubit>().getDashboardPermission();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.kPrimaryColor, width: 2.sp),
              borderRadius: BorderRadius.circular(8.r)),
          child: CustomSvg(
            icon: Assets.medChat,
            size: 50.r,
          )),
      body: CommonBackground(
        child: ListView(
          children: [
            20.verticalSpace,
            const TopBar(),
            30.verticalSpace,
            CallCard(),
            20.verticalSpace,
             AppSlider(imageUrls: sliderList,),
            20.verticalSpace,
            DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TabBar(
                    onTap: (index) {
                      setState(() {
                        selectedTabIndex = index;
                      });
                    },
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    padding: EdgeInsets.zero,
                    labelStyle: kTitleMedium,
                    dividerColor: Colors.transparent,
                    dividerHeight: 0.h,
                    tabs: const [
                      Tab(text: 'My Package'),
                      Tab(text: 'On-Demand Service'),
                    ],
                    indicatorColor: AppColors.kPrimaryColor,
                    labelColor: AppColors.kPrimaryColor,
                    unselectedLabelColor: Colors.grey,
                  ),
                ],
              ),
            ),
            selectedTabIndex == 0
                ? ServiceList(type: "myPackage")
                : ServiceList(),
            15.verticalSpace,
            const BlogList(),
            15.verticalSpace,
          ],
        ),
      ),
    );
  }
}
