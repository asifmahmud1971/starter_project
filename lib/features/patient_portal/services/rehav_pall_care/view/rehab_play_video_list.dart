import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/cubit/rehab_pall_cubit.dart';
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/model/rehab_pall_video_response.dart';
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/view/video_player_screen.dart';
import '../../../../../generated/assets.dart';

class RehabPlayVideoList extends StatefulWidget {
  final String? title;
  const RehabPlayVideoList({super.key,this.title});

  @override
  State<RehabPlayVideoList> createState() => _RehabPlayVideoListState();
}

class _RehabPlayVideoListState extends State<RehabPlayVideoList> {
  @override
  void initState() {
    GetContext.context.read<RehabPallCubit>().faceRehabPallVideoData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title??""),),
      body: BlocBuilder<RehabPallCubit, RehabPallState>(
        builder: (context, state) {
          return (state.rehabPallVideoResponse?.rehabilitativePallVideo??[]).isEmpty?SizedBox():ListView.builder(
            itemCount: state.rehabPallVideoResponse?.rehabilitativePallVideo?.length,
            itemBuilder: (context, index) {
              RehabilitativePallVideo? rehabPallVideo = state.rehabPallVideoResponse?.rehabilitativePallVideo?.elementAt(index);
              return Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.kWhiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      spreadRadius: 1,
                      blurRadius: 30,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: AppColors.kGrayColor200),
                  ),
                  leading: CustomSvg(icon: Assets.iconsVector),
                  title: Text(rehabPallVideo?.videoTitle??""),
                  onTap: () =>  GetContext.to(VideoPlayer(rehabPallVideo: rehabPallVideo)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
