// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:medPilot/core/app/app_dependency.dart' as _i29;
import 'package:medPilot/core/app/app_preference.dart' as _i3;
import 'package:medPilot/data/network/api_client.dart' as _i19;
import 'package:medPilot/data/network/api_request.dart' as _i10;
import 'package:medPilot/features/auth/sign_in/cubit/sign_in_cubit.dart'
    as _i28;
import 'package:medPilot/features/auth/sign_in/repository/sign_in_repository.dart'
    as _i26;
import 'package:medPilot/features/auth/sign_in/repository/sign_in_repository_imp.dart'
    as _i25;
import 'package:medPilot/features/auth/sign_up/cubit/sign_up_cubit.dart' as _i6;
import 'package:medPilot/features/auth/sign_up/repository/sign_up_repository.dart'
    as _i20;
import 'package:medPilot/features/auth/sign_up/repository/sign_up_repository_imp.dart'
    as _i21;
import 'package:medPilot/features/dashboard/cubit/dashboard_cubit.dart' as _i7;
import 'package:medPilot/features/no_internet/cubit/internet_cubit.dart' as _i9;
import 'package:medPilot/features/patient_portal/home/cubit/home_cubit.dart'
    as _i24;
import 'package:medPilot/features/patient_portal/home/repository/home_repository.dart'
    as _i13;
import 'package:medPilot/features/patient_portal/home/repository/home_repository_imp.dart'
    as _i14;
import 'package:medPilot/features/patient_portal/services/cubit/services_cubit.dart'
    as _i16;
import 'package:medPilot/features/patient_portal/services/follow_up/cubit/followup_cubit.dart'
    as _i15;
import 'package:medPilot/features/patient_portal/services/pain_clinic/cubit/painClinic_cubit.dart'
    as _i17;
import 'package:medPilot/features/patient_portal/services/repository/service_repository.dart'
    as _i11;
import 'package:medPilot/features/patient_portal/services/repository/service_repository_imp.dart'
    as _i12;
import 'package:medPilot/features/patient_portal/services/wound_clinic/cubit/woundClinic_cubit.dart'
    as _i18;
import 'package:medPilot/features/profile/cubit/profile_cubit.dart' as _i27;
import 'package:medPilot/features/profile/repository/profile_repository.dart'
    as _i23;
import 'package:medPilot/features/profile/repository/profile_repository_imp.dart'
    as _i22;
import 'package:medPilot/features/theme/cubit/theme_cubit.dart' as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.AppPreferences>(() => _i3.AppPreferences());
  await gh.factoryAsync<_i4.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.factory<_i5.Dio>(() => appModule.dio);
  gh.factory<_i6.SignUpCubit>(() => _i6.SignUpCubit());
  gh.factory<_i7.DashboardCubit>(() => _i7.DashboardCubit());
  gh.factory<_i8.ThemeCubit>(() => _i8.ThemeCubit());
  gh.factory<_i9.InternetCubit>(() => _i9.InternetCubit());
  gh.factory<_i10.ApiRequest>(() => _i10.ApiRequest());
  gh.factory<_i11.ServiceRepository>(
      () => _i12.ServiceRepositoryImp(apiRequest: gh<_i10.ApiRequest>()));
  gh.factory<_i13.HomeRepository>(
      () => _i14.HomeRepositoryImp(apiRequest: gh<_i10.ApiRequest>()));
  gh.factory<_i15.FollowUpCubit>(
      () => _i15.FollowUpCubit(gh<_i11.ServiceRepository>()));
  gh.factory<_i16.ServiceCubit>(
      () => _i16.ServiceCubit(gh<_i11.ServiceRepository>()));
  gh.factory<_i17.PainClinicCubit>(
      () => _i17.PainClinicCubit(gh<_i11.ServiceRepository>()));
  gh.factory<_i18.WoundClinicCubit>(
      () => _i18.WoundClinicCubit(gh<_i11.ServiceRepository>()));
  gh.factory<_i19.ApiClient>(() => _i19.ApiClient(gh<_i5.Dio>()));
  gh.factory<_i20.SignUpRepository>(
      () => _i21.SignUpRepositoryImp(apiRequest: gh<_i10.ApiRequest>()));
  gh.factory<_i22.ProfileRepositoryImp>(
      () => _i23.ProfileRepository(apiClient: gh<_i19.ApiClient>()));
  gh.factory<_i24.HomeCubit>(() => _i24.HomeCubit(gh<_i13.HomeRepository>()));
  gh.factory<_i25.SignInRepositoryImp>(
      () => _i26.SignInRepository(apiClient: gh<_i19.ApiClient>()));
  gh.factory<_i27.ProfileCubit>(
      () => _i27.ProfileCubit(gh<_i22.ProfileRepositoryImp>()));
  gh.factory<_i28.SignInCubit>(
      () => _i28.SignInCubit(gh<_i25.SignInRepositoryImp>()));
  return getIt;
}

class _$AppModule extends _i29.AppModule {}
