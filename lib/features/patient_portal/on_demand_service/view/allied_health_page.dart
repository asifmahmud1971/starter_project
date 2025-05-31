import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/product.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/widget/service_product_card.dart';

class AlliedHealthPage extends StatefulWidget {
  const AlliedHealthPage({super.key});

  @override
  State<AlliedHealthPage> createState() => _AlliedHealthPageState();
}

class _AlliedHealthPageState extends State<AlliedHealthPage> {
  final List<Product> products = [
    Product(
      name: 'Test 1',
      description: 'thjtyrjuh ujgtyruyrtu rutyrtrtrtrtyyuytr',
      price: 10,
      imageUrl:
      'https://i.imgur.com/WaR1kK2.png', // Replace with your image asset or network image
    ),
    Product(
      name: 'Test 1',
      description: 'thjtyrjuh ujgtyruyrtu rutyrtrtrtrtyyuytr',
      price: 10,
      imageUrl:
      'https://i.imgur.com/WaR1kK2.png', // Replace with your image asset or network image
    ),
    Product(
      name: 'Test 1',
      description: 'thjtyrjuh ujgtyruyrtu rutyrtrtrtrtyyuytr',
      price: 10,
      imageUrl:
      'https://i.imgur.com/WaR1kK2.png', // Replace with your image asset or network image
    ),
    // Add more products here if needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppStrings.alliedHealth.tr(),style: kTitleMedium.copyWith(color: Colors.white),),
        backgroundColor: AppColors.kPrimaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ServiceProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}
