import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/cubit/woundClinic_cubit.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/view/add_wound_assessment.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/view/image_view_screen.dart';

class WoundAssessmentPage extends StatefulWidget {
  const WoundAssessmentPage({super.key});

  @override
  State createState() => _WoundAssessmentPageState();
}

class _WoundAssessmentPageState extends State<WoundAssessmentPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<WoundClinicCubit>().getAllWoundAssessment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WoundClinicCubit, WoundClinicState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.woundAssessment.tr(),
              style: kTitleLarge.copyWith(color: Colors.white),
            ),
            backgroundColor: Color(0xFFFF904D),
            iconTheme: IconThemeData(color: Colors.white),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.kPrimaryColor,
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () => GetContext.to(AddWoundAssessment()),
          ),
          body: GridView.builder(
            padding: EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemCount: (state.allWoundData?.woundAssessment??[]).length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GetContext.to(GalleryViewerScreen(
                    imageUrls: [state.allWoundData?.woundAssessment?[index].image??""],
                    initialIndex: index,
                  ));
                },
                child: Hero(
                  tag: 'image_$index',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      state.allWoundData?.woundAssessment?[index].image??"",
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                            color: Color(0xFFFF904D),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: Icon(Icons.broken_image, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
