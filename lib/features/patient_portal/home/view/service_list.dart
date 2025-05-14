import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/home/model/service_model.dart';
import 'package:medPilot/features/patient_portal/home/widgets/service_card.dart';

class ServiceList extends StatefulWidget {
  final String? title;
  final List<ServiceModel>? serviceDataList;

  const ServiceList({super.key, this.title, this.serviceDataList});

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child:
                      Text(widget.title ?? "", style: kTitleMedium.copyWith())),
              //Text("See All", style: kTitleMedium.copyWith(color: AppColors.kPrimarySpeechBlue600)),
            ],
          ),
          10.verticalSpace,
          GridView.count(
            shrinkWrap: true,
            // Important
            physics: NeverScrollableScrollPhysics(),
            // Important
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: EdgeInsets.all(0),
            children: List.generate(
                (widget.serviceDataList ?? []).length,
                (index) => ServiceCard(
                      serviceModel: widget.serviceDataList?[index],
                    )),
          ),
        ],
      ),
    );
  }
}
