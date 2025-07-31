import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/home/cubit/home_cubit.dart';
import 'package:medPilot/features/patient_portal/home/widgets/service_card.dart';

class ServiceList extends StatefulWidget {
  final String? title;
  final String? type;

  const ServiceList({super.key, this.title, this.type});

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.verticalSpace,
              Visibility(
                visible: widget.type == "myPackage",
                child: Wrap(
                  children: List.generate((state.subscriberDetails?.subscribePackage??[]).length, (index){
                    return   Text("${state.subscriberDetails?.subscribePackage?[index].packageName} ",
                        style: kBodyLarge.copyWith(color: AppColors.kPrimarySpeechBlue500));
                  }),
                ),
              ),
              10.verticalSpace,
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.type == "myPackage"
                    ? (state.dashboardPermission?.myPackage ?? []).length
                    : (state.dashboardPermission?.onDemand ?? []).length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12.w,
                  crossAxisSpacing: 8.h,
                  childAspectRatio: 0.75,
                ),
                padding: EdgeInsets.all(0),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      widget.type == "myPackage"
                          ? ServiceCard(
                              onTap: () {
                                GetContext.toNamed(
                                    route: state.dashboardPermission
                                        ?.myPackage?[index].key);
                              },
                              title: state.dashboardPermission
                                  ?.myPackage?[index].serviceName,
                              icon: state.dashboardPermission?.myPackage?[index]
                                  .staticIcon,
                            )
                          : ServiceCard(
                              onTap: () {
                                GetContext.toNamed(
                                    route: state.dashboardPermission
                                        ?.onDemand?[index].key);
                              },
                              title: state.dashboardPermission?.onDemand?[index]
                                  .serviceName,
                              icon: state.dashboardPermission?.onDemand?[index]
                                  .staticIcon,
                            )
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
