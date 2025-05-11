import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_image.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/patient_portal/home/helper/dummy_slider_list.dart';

class AppSlider extends StatelessWidget {
  const AppSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return  FlutterCarousel(
      options: FlutterCarouselOptions(
        height: 170.0,
        autoPlay : true,
        autoPlayCurve: Curves.easeInOutQuad,
        autoPlayInterval : const Duration(seconds: 5),
        showIndicator: true,
        enlargeCenterPage: true,
        slideIndicator: CircularSlideIndicator(
            slideIndicatorOptions: SlideIndicatorOptions(
          enableAnimation: true,
          indicatorRadius: 6,
          currentIndicatorColor: AppColors.kPrimaryColor,
        )),
      ),
      items: sliderList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.amber,borderRadius: BorderRadius.circular(10.r)
                ),
                child: CustomImage(baseUrl:i,radius: 10.r,)
            );
          },
        );
      }).toList(),
    );
  }
}
