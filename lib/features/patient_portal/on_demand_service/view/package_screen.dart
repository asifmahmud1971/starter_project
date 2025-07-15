import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/widgets/service_card.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/cubit/onDemand_service_cubit.dart';
import 'package:medPilot/generated/assets.dart';
List<Package> packageList = [
  Package(serviceName: "Tele Health",icon:  Assets.medTelePackage,key: "tele_package"),
  Package(serviceName: "Home Care",icon: Assets.medHomePackage,key: "home_package"),
  Package(serviceName: "Clinic",icon: Assets.medInPatientRequest,key: "clinic"),
];

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Package'),
        centerTitle: true,
      ),
      body: BlocBuilder<OnDemandServiceCubit, OnDemandServiceState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  padding: EdgeInsets.all(0),
                  children: List.generate(
                      packageList.length,
                          (index) => ServiceCard(
                        onTap: () {
                          GetContext.toNamed(
                              route: packageList[index].key);
                        },
                        title: packageList[index].serviceName,
                        icon: packageList[index].icon,
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
