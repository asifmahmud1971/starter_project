// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:demo/core/app/app_dependency.dart' as _i19;
import 'package:demo/core/app/app_preference.dart' as _i3;
import 'package:demo/data/network/api_client.dart' as _i13;
import 'package:demo/data/network/api_request.dart' as _i12;
import 'package:demo/features/screens/auth/sign_in/cubit/sign_in_cubit.dart'
    as _i7;
import 'package:demo/features/screens/auth/sign_in/repository/sign_in_repository.dart'
    as _i14;
import 'package:demo/features/screens/auth/sign_in/repository/sign_in_repository_imp.dart'
    as _i15;
import 'package:demo/features/screens/auth/sign_up/cubit/sign_up_cubit.dart'
    as _i8;
import 'package:demo/features/screens/auth/sign_up/repository/sign_up_repository.dart'
    as _i16;
import 'package:demo/features/screens/auth/sign_up/repository/sign_up_repository_imp.dart'
    as _i17;
import 'package:demo/features/screens/dashboard/cubit/dashboard_cubit.dart'
    as _i9;
import 'package:demo/features/screens/home/cubit/home_cubit.dart' as _i6;
import 'package:demo/features/screens/home/repository/home_repo_imp.dart'
    as _i18;
import 'package:demo/features/screens/no_internet/cubit/internet_cubit.dart'
    as _i11;
import 'package:demo/features/screens/theme/cubit/theme_cubit.dart'
    as _i10;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
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
  gh.factory<_i6.HomeCubit>(() => _i6.HomeCubit());
  gh.factory<_i7.SignInCubit>(() => _i7.SignInCubit());
  gh.factory<_i8.SignUpCubit>(() => _i8.SignUpCubit());
  gh.factory<_i9.DashboardCubit>(() => _i9.DashboardCubit());
  gh.factory<_i10.ThemeCubit>(() => _i10.ThemeCubit());
  gh.factory<_i11.InternetCubit>(() => _i11.InternetCubit());
  gh.factory<_i12.ApiRequest>(() => _i12.ApiRequest());
  gh.factory<_i13.ApiClient>(() => _i13.ApiClient(gh<_i5.Dio>()));
  gh.factory<_i14.SignInRepository>(
      () => _i15.SignInRepositoryImp(apiRequest: gh<_i12.ApiRequest>()));
  gh.factory<_i16.SignUpRepository>(
      () => _i17.SignUpRepositoryImp(apiRequest: gh<_i12.ApiRequest>()));
  gh.factory<_i18.HomeRepositoryImp>(
      () => _i18.HomeRepositoryImp(apiRequest: gh<_i12.ApiRequest>()));
  return getIt;
}

class _$AppModule extends _i19.AppModule {}
