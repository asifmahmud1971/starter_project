import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_image.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/services/upload_document/cubit/document_cubit.dart';
import 'package:medPilot/features/patient_portal/services/upload_document/view/upload_document.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/view/add_wound_assessment.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/view/image_view_screen.dart';
import 'package:medPilot/generated/assets.dart';
import 'package:photo_view/photo_view.dart';

class AllUploadPage extends StatefulWidget {
  @override
  _AllUploadPageState createState() => _AllUploadPageState();
}

class _AllUploadPageState extends State<AllUploadPage> {
  // Sample image URLs - replace with your actual image sources
  final List<String> imageUrls = [
    'https://picsum.photos/id/10/800/600',
    'https://picsum.photos/id/11/800/600',
    'https://picsum.photos/id/12/800/600',
    'https://picsum.photos/id/13/800/600',
    'https://picsum.photos/id/14/800/600',
    'https://picsum.photos/id/15/800/600',
  ];

  @override
  void initState() {
    // TODO: implement initState
    context.read<DocumentCubit>().getDocument();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentCubit, DocumentState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.allDocuments.tr(),
              style: kTitleLarge.copyWith(color: Colors.white),
            ),
            backgroundColor: Color(0xFFFF904D),
            iconTheme: IconThemeData(color: Colors.white),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.kPrimaryColor,
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () => GetContext.to(UploadDocument()),
          ),
          body: GridView.builder(
            padding: EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9,
            ),
            itemCount: (state.documentModel?.uploadDocument??[]).length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GetContext.to(GalleryViewerScreen(                    imageUrls: [state.documentModel?.uploadDocument?[index].file??""],
                    initialIndex: index,
                  ));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Hero(
                        tag: 'image_$index',
                        child: CustomImage(
                          baseUrl: state.documentModel?.uploadDocument?[index].file??"",
                          placeHolder: Assets.imagesCardImageThumb,
                        ),
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      state.documentModel?.uploadDocument?[index].title??"",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                      kBodyLarge.copyWith(color: AppColors.kTextPrimaryColor),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
