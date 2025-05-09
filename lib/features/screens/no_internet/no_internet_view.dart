import 'package:demo/core/components/custom_svg.dart';
import 'package:demo/core/constants/app_colors.dart';
import 'package:demo/core/constants/app_strings.dart';
import 'package:demo/core/constants/app_text_style.dart';
import 'package:demo/features/screens/no_internet/cubit/internet_cubit.dart';
import 'package:demo/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state.status == NetworkState.connected) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomSvg(
                    icon: Assets.iconsHome,
                    color: AppColors.kError950,
                    size: 100.r,
                  ),
                  8.verticalSpace,
                  Text(
                    AppStrings.noInternetConnection.tr(),
                    style: kTitleMedium,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
