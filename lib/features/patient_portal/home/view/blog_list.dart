import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/features/patient_portal/home/cubit/home_cubit.dart';
import 'package:medPilot/features/patient_portal/home/widgets/blog_card.dart';

import '../../../../core/constants/app_text_style.dart';

class BlogList extends StatefulWidget {
  const BlogList({super.key});

  @override
  State<BlogList> createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeCubit>().getBlog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Latest article", style: kTitleMedium.copyWith()),
              10.verticalSpace,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate((state.blogModel?.data??[]).length, (index) {
                    return BlogCard(blogData: (state.blogModel?.data??[])[index],);
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
