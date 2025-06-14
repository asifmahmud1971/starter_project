import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_image.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/product.dart';

class ServiceProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ServiceProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      margin: EdgeInsets.only(right: 16.w),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Medical Image Badge
          Container(
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor.withOpacity(0.1),
            ),
            child: Stack(
              children: [
                CustomImage(
                  baseUrl: product.imageUrl ?? "https://img.freepik.com/free-vector/medical-treatment-icons-set_1284-14222.jpg",
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      "MEDICAL",
                      style: kBodySmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Service Details
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.medical_services_outlined,
                            size: 16.r,
                            color: AppColors.kPrimaryColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            product.name,
                            style: kBodyLarge.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.blueGrey[800],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        product.description,
                        style: kBodyMedium.copyWith(
                          color: Colors.blueGrey[600],
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.h),
                      _buildServiceFeatures(),
                    ],
                  ),

                  // Action Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '৳ ${product.price.toStringAsFixed(0)}',
                        style: kBodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 8.h,
                          ),
                          minimumSize: Size.zero,
                        ),
                        child: Text(
                          "Book Now",
                          style: kBodyMedium.copyWith(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceFeatures() {
    return Wrap(
      spacing: 8.w,
      runSpacing: 4.h,
      children: [
        _buildFeatureChip(Icons.access_time_filled, "30-60 mins"),
        _buildFeatureChip(Icons.person_outline, "Specialist"),
        _buildFeatureChip(Icons.home_outlined, "At Home"),
      ],
    );
  }

  Widget _buildFeatureChip(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12.r,
            color: AppColors.kPrimaryColor,
          ),
          SizedBox(width: 4.w),
          Text(
            text,
            style: kBodySmall.copyWith(
              color: Colors.blueGrey[600],
            ),
          ),
        ],
      ),
    );
  }
}