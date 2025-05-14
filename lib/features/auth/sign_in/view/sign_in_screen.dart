import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medPilot/core/components/custom_image.dart';
import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/core/components/custom_text_field.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:medPilot/generated/assets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              100.verticalSpace,
              // Logo with your brand colors
              Image.asset(
                Assets.imagesHorizontalLogo,
                height: 60.h,
              ),
              40.verticalSpace,
              Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.kPrimarySpeechBlue500,
                    ),
                textAlign: TextAlign.center,
              ),
              8.verticalSpace,
              Text(
                'Securely access your health records',
                style: TextStyle(
                  color: AppColors.kGrayColor600,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
              40.verticalSpace,
              // Email Field
              CustomTextField(
                controller: context.read<SignInCubit>().emailCtrl,
                radius: 10.r,
                labelText: AppStrings.enterEmail.tr(),
                labelStyle:
                    kBodyMedium.copyWith(color: AppColors.kGrayColor400),
              ),
              20.verticalSpace,
              // Password Field
              CustomTextField(
                controller: context.read<SignInCubit>().passwordCtrl,
                radius: 10.r,
                labelText: AppStrings.enterPassword.tr(),
                labelStyle:
                    kBodyMedium.copyWith(color: AppColors.kGrayColor400),
              ),
              16.verticalSpace,
              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.forgotPassword.tr(),
                    style: kBodyLarge.copyWith(color: AppColors.kPrimaryColor),
                  ),
                ),
              ),
              24.verticalSpace,
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
                  AppStrings.login.tr(),
                  style: kTitleMedium.copyWith(color: AppColors.kWhiteColor),
                ),
              ),
              30.verticalSpace,
              // Divider
              /*     Row(
                children: [
                  Expanded(child: Divider(color: AppColors.kGrayColor300)),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      AppStrings.or.tr(),
                      style: kBodyLarge.copyWith(color: AppColors.kGrayColor500),
                    ),
                  ),
                  Expanded(child: Divider(color: AppColors.kGrayColor300)),
                ],
              ),
              20.verticalSpace,
              // Biometric Login
              // Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.dontHaveAnAccount.tr(),
                    style: kBodyMedium.copyWith(color: AppColors.kGrayColor500),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.signUp.tr(),
                      style: TextStyle(color: AppColors.kPrimaryColor),
                    ),
                  ),
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
