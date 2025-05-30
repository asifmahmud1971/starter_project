import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/cubit/rehab_pall_cubit.dart';
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/model/rehab_pall_care_response.dart';
import 'rehab_play_video_list.dart';

class RehabPallCareScreen extends StatefulWidget {
  const RehabPallCareScreen({super.key});

  @override
  State createState() => _RehabPallCareScreenState();
}

class _RehabPallCareScreenState extends State<RehabPallCareScreen> {
  @override
  void initState() {
    GetContext.context.read<RehabPallCubit>().faceRehabPallCareData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Therapy'),
        ),
        body: BlocBuilder<RehabPallCubit, RehabPallState>(
          builder: (context, state) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, // Maximum width of each item
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              padding: EdgeInsets.all(16),
              itemCount: state.rehabPallCareResponse?.rehabilitativePallMenu?.length,
              itemBuilder: (context, index) {
                RehabilitativePallMenu? rehabPallMenu = state.rehabPallCareResponse?.rehabilitativePallMenu?.elementAt(index);
                return InkWell(
                  onTap: (){
                    GetContext.to(RehabPlayVideoList(title: rehabPallMenu?.menuName??"",));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.kWhiteColor,
                        boxShadow: [AppColors.backgroundShadow]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network("https://krishnahospital.in/wp-content/uploads/2019/12/slide-21-1.jpg"),
                        )),
                        5.verticalSpace,
                        Text(
                          rehabPallMenu?.menuName ?? "",
                          textAlign: TextAlign.center,
                          style: kBodyMedium,
                          maxLines: 1,
                        ),
                        10.verticalSpace,
                      ],
                    ),
                  ),
                );
              },
            );
          },
        )
    );
  }

}