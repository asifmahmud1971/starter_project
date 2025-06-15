import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_image.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/home_visit_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/product.dart';

// Replace the MedicalServiceCard with this enhanced version
class ServiceProductCard extends StatelessWidget {
  final Product? service;
  final VoidCallback onAddToCart;
  final bool isInCart;

  const ServiceProductCard({
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
                      service?.productName??"",
                      style: kHeadLineSmall.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),

                    // Product description
                    Text(
                      service?.description??"",
                      style: kBodyMedium.copyWith(
                        color: AppColors.kSecondaryIndigo,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      '${20.234.toStringAsFixed(2)} BDT',
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
            child: TextButton.icon(
              icon: Icon(
                isInCart ? Icons.shopping_cart : Icons.add_shopping_cart,
                color: AppColors.kPrimaryColor,
                size: 24.sp,
              ),
              onPressed: onAddToCart,
              label: Text(
                'Add to cart',
                style: kLabelLarge.copyWith(
                  color: AppColors.kPrimaryColor,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: isInCart ? AppColors.kPrimaryColor : Colors.transparent, // Background changes when in cart
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: BorderSide(
                    color: AppColors.kPrimaryColor,
                    width: 1.w,
                  ),
                ),
                // Visual feedback effects
                // Elevation/shadow
                elevation: 0,
                shadowColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
