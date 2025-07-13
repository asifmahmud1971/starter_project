import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_button.dart';
import 'package:medPilot/core/components/custom_image.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/cart/cubit/cart_cubit.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/on_sarevice_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/product.dart';

// Replace the MedicalServiceCard with this enhanced version
class LabReportCardWidget extends StatelessWidget {
  final Product? service;
  final VoidCallback onAddToCart;
  final bool isInCart;

  const LabReportCardWidget({
    super.key,
    required this.service,
    required this.onAddToCart,
    this.isInCart = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: AppColors.kDecoration,
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                service?.productName ?? "",
                style: kHeadLineSmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              10.horizontalSpace,
              Text(
                '${service?.price} BDT',
                style: kHeadLineSmall.copyWith(
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Spacer(),
          Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  onTap: (){
                    context.read<CartCubit>().addProductToCart(
                        productId: service?.productId.toString(),
                        categoryId: service?.categoryId.toString(),
                        quantity: "1",
                        type: service?.type??""
                    );
                  },
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
