import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_text_field.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:medPilot/generated/assets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(AppStrings.forgotPassword.tr(),style: kBodyLarge,)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              40.verticalSpace,
              CustomTextField(
                controller: context.read<SignInCubit>().passwordCtrl,
                radius: 10.r,
                labelText: AppStrings.enterNewPassword.tr(),
                labelStyle:
                    kBodyMedium.copyWith(color: AppColors.kGrayColor400),
              ),
              16.verticalSpace,
              CustomTextField(
                controller: context.read<SignInCubit>().passwordCtrl,
                radius: 10.r,
                labelText: AppStrings.enterReNewPassword.tr(),
                labelStyle:
                    kBodyMedium.copyWith(color: AppColors.kGrayColor400),
              ),
              40.verticalSpace,
              // Login Button
              ElevatedButton(
                onPressed: () {
                  context.read<SignInCubit>().signIn();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  AppStrings.submit.tr(),
                  style: kTitleMedium.copyWith(color: AppColors.kWhiteColor),
                ),
              ),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
