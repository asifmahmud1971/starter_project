import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/core/router/routes.dart';
import 'package:medPilot/features/patient_portal/home/cubit/home_cubit.dart';
import 'package:medPilot/features/patient_portal/home/model/service_model.dart';
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
              Row(
                children: [
                  Expanded(
                      child: Text(widget.title ?? "",
                          style: kTitleMedium.copyWith())),
                ],
              ),
              10.verticalSpace,
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                padding: EdgeInsets.all(0),
                children: widget.type == "myPackage"
                    ? List.generate(
                        (state.dashboardPermission?.myPackage ?? []).length,
                        (index) => ServiceCard(
                              onTap: () {
                                GetContext.toNamed(
                                    route: state.dashboardPermission
                                        ?.myPackage?[index].key);
                              },
                              title: state.dashboardPermission
                                  ?.myPackage?[index].serviceName,
                              icon: state.dashboardPermission?.myPackage?[index]
                                  .staticIcon,
                            ))
                    : List.generate(
                        (state.dashboardPermission?.onDemand ?? []).length,
                        (index) => ServiceCard(
                          onTap: (){
                            GetContext.toNamed(
                                route: state.dashboardPermission
                                    ?.onDemand?[index].key);
                          },
                              title: state.dashboardPermission?.onDemand?[index]
                                  .serviceName,
                              icon: state.dashboardPermission?.onDemand?[index]
                                  .staticIcon,
                            )),
              ),
            ],
          ),
        );
      },
    );
  }
}
