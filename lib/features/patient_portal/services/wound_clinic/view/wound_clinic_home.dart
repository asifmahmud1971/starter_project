import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/home/widgets/service_card.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/view/assesment_page.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/view/medication_screen.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/view/wound_assesment_page.dart';
import 'package:medPilot/generated/assets.dart';

class WoundClinicHome extends StatelessWidget {
  const WoundClinicHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.painClinic.tr(),style: kTitleMedium,),),
      body: Padding(
        padding:  EdgeInsets.all(16.r),
        child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: EdgeInsets.all(0),
          children: [ServiceCard(
            onTap: () {
              GetContext.to(WoundAssessmentPage());
            },
            title: AppStrings.assessment.tr(),
            icon: Assets.medWound,
          ),ServiceCard(
            onTap: () {
              GetContext.to(MedicationScreen());
            },
            title: AppStrings.management.tr(),
            icon: Assets.medWoundDersing,
          )],
        ),
      ),
    );
  }
}
