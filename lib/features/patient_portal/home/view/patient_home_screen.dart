import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/common_background.dart';
import 'package:medPilot/core/components/custom_app_bar.dart';
import 'package:medPilot/core/components/custom_image.dart';
import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/features/patient_portal/home/helper/dummy_slider_list.dart';
import 'package:medPilot/features/patient_portal/home/view/service_list.dart';
import 'package:medPilot/features/patient_portal/home/widgets/app_slider.dart';
import 'package:medPilot/features/patient_portal/home/widgets/top_bar.dart';
import 'package:medPilot/generated/assets.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  @override
  void initState() {
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
      body: CommonBackground(
        child: ListView(
          children: [
            20.verticalSpace,
            TopBar(),
             30.verticalSpace,
            AppSlider(),
            20.verticalSpace,
            ServiceList()
          ],
        ),
      ),
    );
  }
}
