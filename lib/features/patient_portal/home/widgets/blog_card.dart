import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_image.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/home/model/blog_model.dart';
import 'package:medPilot/features/patient_portal/home/view/blog_details.dart';

class BlogCard extends StatelessWidget {
  final BlogData? blogData;
  const BlogCard({super.key, this.blogData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GetContext.to(BlogDetailScreen(blogData: blogData,));
      },
      child: Padding(
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
                      blogData?.image??"",
                ),
              ),
              10.verticalSpace,
              Text(
               blogData?.title??"",
                maxLines: 5,
                style: kBodyMedium,
              ),
              8.verticalSpace,
              Text(
                blogData?.date??"",
                style: kBodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
