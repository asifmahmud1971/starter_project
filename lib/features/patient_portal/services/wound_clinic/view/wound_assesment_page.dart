import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/view/add_wound_assessment.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/view/image_view_screen.dart';

class WoundAssessmentPage extends StatefulWidget {
  const WoundAssessmentPage({super.key});

  @override
  State createState() => _WoundAssessmentPageState();
}

class _WoundAssessmentPageState extends State<WoundAssessmentPage> {
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
  Widget build(BuildContext context) {
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
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GetContext.to(GalleryViewerScreen(
                imageUrls: imageUrls,
                initialIndex: index,
              ));
            },
            child: Hero(
              tag: 'image_$index',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrls[index],
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
  }
}
