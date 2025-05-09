import 'package:demo/features/screens/auth/sign_up/models/app_gender.dart';
import 'package:easy_localization/easy_localization.dart';

import '../constants/app_strings.dart';
import '../constants/strings.dart';

class Validator {
  static String? fullName(String? v) {
    if (v == null || v == '' || v.trim() == '') {
      return AppStrings.signUpFullNameRequiredErr.tr();
    }

    final nameRegExp = RegExp(r"^[a-zA-Z-' ]+$");
    if (!nameRegExp.hasMatch(v)) {
      return AppStrings.signUpFullNameRequiredErr.tr();
    }

    final isHeiFan = v.split('').every((char) => char == '\'');
    final isDot = v.split('').every((char) => char == '-');

    if (isHeiFan == true || isDot == true) {
      return AppStrings.signUpFullNameRequiredErr.tr();
    }

    if (v.length < 2) return AppStrings.signUpFullNameMinLengthErr.tr();

    if (v.length > 30) return AppStrings.signUpFullNameRequiredErr.tr();

    return null;
  }

  static String? fName(String? v) {
    if (v == null || v == '') {
      return AppStrings.checkoutAddressFirstNameRequired.tr();
    }

    return null;
  }

  static String? lName(String? v) {
    if (v == null || v == '') {
      return AppStrings.checkoutAddressLastNameRequired.tr();
    }

    return null;
  }

  static String? companyName(String? v) {
    if (v == null || v == '') return null;

    if (v.length > 100) {
      return AppStrings.checkoutAddressCompanyNameMax100Char.tr();
    }

    return null;
  }

  static String? country(String? v) {
    if (v == null || v == '') {
      return AppStrings.checkoutAddressCountryOrRegionRequired.tr();
    }

    if (v.length > 100) {
      return AppStrings.checkoutAddressCountryOrRegionMax100.tr();
    }

    return null;
  }

  static String? street(String? v) {
    if (v == null || v == '') {
      return AppStrings.checkoutAddressStreetRequired.tr();
    }

    if (v.length > 100) return AppStrings.checkoutAddressStreetMax100.tr();

    return null;
  }

  static String? city(String? v) {
    if (v == null || v == '') {
      return AppStrings.checkoutAddressLocationOrCityRequired.tr();
    }

    if (v.length > 100) {
      return AppStrings.checkoutAddressLocationOrCityMax100.tr();
    }

    return null;
  }

  static String? postCode(String? v) {
    if (v == null || v == '') {
      return AppStrings.checkoutAddressPostalCodeRequired.tr();
    }

    if (v.length > 100) return AppStrings.checkoutAddressPostalCodeMax100.tr();

    return null;
  }

  static String? comments(String? v) {
    if (v == null || v == '') return null;

    if (v.length > 500) return AppStrings.checkoutAddressCommentsMax500.tr();

    return null;
  }

  static String? email(String? v) {
    if (v == null || v == '') {
      return AppStrings.signUpEmailRequiredErr.tr();
    }

    if (!emailValidatorRegExp.hasMatch(v)) {
      return AppStrings.signUpEmailRequiredErr.tr();
    }

    return null;
  }

  static String? phone(String? v) {
    if (v == null || v == '') {
      return AppStrings.provideValidNumber.tr();
    }

    if (!mobileNumberRegex.hasMatch(v)) {
      return AppStrings.provideValidNumber.tr();
    }

    return null;
  }

  static String? dob(String? v) {
    if (v == null || v == '') {
      return AppStrings.signUpDobRequiredErr.tr();
    }

    return null;
  }

  static String? gender(AppGender? gender) {
    if (gender == null) {
      return '     ${AppStrings.signUpGenderRequiredErr.tr()}';
    }

    return null;
  }

  static String? password(String? v) {
    if (v == null || v == '') {
      return AppStrings.signInPasswordRequiredErr.tr();
    }

    if (v.length > 20) return AppStrings.signInPasswordMaxErr.tr();

    if (v.length < 6) return AppStrings.signInPasswordMinErr.tr();

    if (!v.contains(RegExp(r'[A-Z]'))) {
      return AppStrings.signInPasswordUppercaseCharErr.tr();
    }

    if (!v.contains(RegExp(r'[a-z]'))) {
      return AppStrings.signInPasswordLowercaseCharErr.tr();
    }

    if (!v.contains(RegExp(r'[0-9]'))) {
      return AppStrings.signInPasswordNumberCharErr.tr();
    }

    if (!v.contains(RegExp(r'[~!@#$%^&*()_+`{}|<>?;:.,=[\]\\/\-]'))) {
      return AppStrings.signInPasswordSpecialCharErr.tr();
    }

    return null;
  }
}
