import 'package:demo/core/constants/app_strings.dart';

class AppGender {
  final String label;
  final String value;

  AppGender(this.label, this.value);

  static final genders = <AppGender>[
    AppGender(AppStrings.signUpGenderMale, 'male'),
    AppGender(AppStrings.signUpGenderFemale, 'female'),
    AppGender(AppStrings.signUpGenderDiverse, 'diverse'),
    AppGender(AppStrings.signUpGenderNotShare, ''),
  ];
}
