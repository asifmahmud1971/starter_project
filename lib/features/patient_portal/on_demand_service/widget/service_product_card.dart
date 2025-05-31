import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_image.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/product.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/view/home_visit_page.dart';

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
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(8),
        boxShadow:  [
          AppColors.kBackGroundShadow
        ],
      ),
      child: Column(

        children: [
          // Brand Logo or Image
          CustomImage(
            baseUrl:
            "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEij2tWZE7ZIDpQogZOf5lGgQk4xnxBVFGV8jke1qO_FE7Gb0fFMTb_1tWDPBmjNYmQazZBu2lkxpeoslP7uAlN-oBkbD28sUuRhQGcHxFWsJJTDC0QWKgX8yskL1cSlVFSGaO0YH9Rptu8/s1600/Home_Visit_Physiotherapy_Odhav.jpg",
          ),

          // Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 6),

                // Description
                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 12),

                // Price and Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '৳ ${product.price.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: onTap,
                      icon:  Icon(Icons.add_shopping_cart, size: 18.r,color: Colors.white),
                      label:  Text("Add",style: kBodyMedium.copyWith(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: AppColors.kPrimaryColor,
                        backgroundColor: AppColors.kPrimaryColor,
                        foregroundColor: AppColors.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 1,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 14,
                        ),
                      ),
                    ),
                  ],
                )
              ],),
          )
        ],
      ),
    );
  }
}