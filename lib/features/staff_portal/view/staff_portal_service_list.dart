import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/core/router/routes.dart';
import 'package:medPilot/features/patient_portal/home/cubit/home_cubit.dart';
import 'package:medPilot/features/patient_portal/home/model/service_model.dart';
import 'package:medPilot/features/patient_portal/home/widgets/service_card.dart';

class StaffPortalServiceList extends StatefulWidget {
  final String? title;
  final String? type;

  const StaffPortalServiceList({super.key, this.title, this.type});

  @override
  State<StaffPortalServiceList> createState() => _StaffPortalServiceListState();
}

class _StaffPortalServiceListState extends State<StaffPortalServiceList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.quickActions.tr(),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              padding: EdgeInsets.all(0),
              children: List.generate(
                  (state.staffPermissionModel?.staffPermission ?? []).length,
                      (index) => ServiceCard(
                    onTap: (){
                      GetContext.toNamed(
                          route: state.staffPermissionModel?.staffPermission?[index].key);
                    },
                    title: state.staffPermissionModel?.staffPermission?[index]
                        .serviceName,
                    icon: state.staffPermissionModel?.staffPermission?[index]
                        .staticIcon,
                  )),
            ),
          ],
        );
      },
    );
  }
}
