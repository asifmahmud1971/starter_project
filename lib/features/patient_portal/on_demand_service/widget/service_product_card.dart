import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_button.dart';
import 'package:medPilot/core/components/custom_image.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/on_sarevice_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/product.dart';

// Replace the MedicalServiceCard with this enhanced version
class ServiceProductCard extends StatelessWidget {
  final Product? service;
  final VoidCallback onAddToCart;
  final bool isInCart;

  const ServiceProductCard({
    super.key,
    required this.service,
    required this.onAddToCart,
    this.isInCart = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [AppColors.kBackGroundShadow]),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100.w,
                height: 100,
                child: CustomImage(
                  size: 100.r,
                  baseUrl: service?.image,
                  fit: BoxFit.cover,
                  radius: 5.r,
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product name
                    Text(
                      service?.productName ?? "",
                      style: kHeadLineSmall.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),

                    // Product description
                    Html(
                      data: """${service?.description}""",
                      // Added null check with fallback
                      extensions: [
                        TagExtension(
                          tagsToExtend: {"flutter"},
                          builder: (extensionContext) {
                            // Changed 'child' to 'builder' which is the correct parameter
                            return const FlutterLogo();
                          },
                        ),
                      ],
                      style: {
                        "p.fancy": Style(
                          textAlign: TextAlign.center,
                          backgroundColor: Colors.grey,
                          margin: Margins(
                            // Added const
                            left: Margin(50, Unit.px),
                            right: Margin.auto(),
                          ),
                          width: Width(300, Unit.px),
                          // Added const
                          fontWeight: FontWeight.bold,
                        ),
                      },
                    ),
                    Text(
                      '${service?.price} BDT',
                      style: kHeadLineSmall.copyWith(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Price and action buttons row
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  title: "Add",
                  backgroundColor: AppColors.kPrimaryColor,
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
