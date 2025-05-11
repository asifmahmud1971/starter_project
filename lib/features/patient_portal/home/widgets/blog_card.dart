import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_image.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Container(
        width: 300.h,
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
            color: Colors.white, boxShadow: [AppColors.backgroundShadow]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150.h,
              width: 300.h,
              child: CustomImage(
                radius: 5.r,
                baseUrl:
                    "https://peolc.easternhealth.ca/wp-content/uploads/sites/46/slider/cache/e0093206b2dd86fba647822820a75c8a/iStock-915042068-scaled.jpg",
              ),
            ),
            10.verticalSpace,
            Text(
              "A palliative approach to care can help improve quality of life",
              maxLines: 5,
              style: kBodyMedium,
            ),
            8.verticalSpace,
            Text(
              "03 Apr. 2025",
              style: kBodySmall,
            )
          ],
        ),
      ),
    );
  }
}
