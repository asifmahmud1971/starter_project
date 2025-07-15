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
import 'package:medPilot/core/app/app_dependency.dart' as _i58;
import 'package:medPilot/core/app/app_preference.dart' as _i3;
import 'package:medPilot/data/network/api_client.dart' as _i28;
import 'package:medPilot/data/network/api_request.dart' as _i10;
import 'package:medPilot/features/auth/forgot_password/cubit/forgot_password_cubit.dart'
    as _i54;
import 'package:medPilot/features/auth/forgot_password/repository/forgot_password_repository.dart'
    as _i53;
import 'package:medPilot/features/auth/forgot_password/repository/forgot_password_repository_imp.dart'
    as _i52;
import 'package:medPilot/features/auth/sign_in/cubit/sign_in_cubit.dart'
    as _i56;
import 'package:medPilot/features/auth/sign_in/repository/sign_in_repository.dart'
    as _i45;
import 'package:medPilot/features/auth/sign_in/repository/sign_in_repository_imp.dart'
    as _i44;
import 'package:medPilot/features/auth/sign_up/cubit/sign_up_cubit.dart' as _i6;
import 'package:medPilot/features/auth/sign_up/repository/sign_up_repository.dart'
    as _i34;
import 'package:medPilot/features/auth/sign_up/repository/sign_up_repository_imp.dart'
    as _i35;
import 'package:medPilot/features/dashboard/cubit/dashboard_cubit.dart' as _i7;
import 'package:medPilot/features/no_internet/cubit/internet_cubit.dart' as _i9;
import 'package:medPilot/features/patient_portal/cart/cubit/cart_cubit.dart'
    as _i41;
import 'package:medPilot/features/patient_portal/cart/repository/cart_repository.dart'
    as _i17;
import 'package:medPilot/features/patient_portal/cart/repository/cart_repository_imp.dart'
    as _i18;
import 'package:medPilot/features/patient_portal/chat/cubit/chat_cubit.dart'
    as _i42;
import 'package:medPilot/features/patient_portal/chat/repository/chat_repository.dart'
    as _i15;
import 'package:medPilot/features/patient_portal/chat/repository/chat_repository_imp.dart'
    as _i16;
import 'package:medPilot/features/patient_portal/home/cubit/home_cubit.dart'
    as _i40;
import 'package:medPilot/features/patient_portal/home/repository/home_repository.dart'
    as _i21;
import 'package:medPilot/features/patient_portal/home/repository/home_repository_imp.dart'
    as _i22;
import 'package:medPilot/features/patient_portal/on_demand_service/cubit/onDemand_service_cubit.dart'
    as _i50;
import 'package:medPilot/features/patient_portal/on_demand_service/repository/onDemandService_repository.dart'
    as _i19;
import 'package:medPilot/features/patient_portal/on_demand_service/repository/onDemandService_repository_imp.dart'
    as _i20;
import 'package:medPilot/features/patient_portal/services/cubit/services_cubit.dart'
    as _i24;
import 'package:medPilot/features/patient_portal/services/follow_up/cubit/followup_cubit.dart'
    as _i23;
import 'package:medPilot/features/patient_portal/services/invesigation/cubit/investigation_cubit.dart'
    as _i57;
import 'package:medPilot/features/patient_portal/services/invesigation/repository/investigation_repository.dart'
    as _i49;
import 'package:medPilot/features/patient_portal/services/invesigation/repository/investigation_repository_imp.dart'
    as _i48;
import 'package:medPilot/features/patient_portal/services/pain_clinic/cubit/painClinic_cubit.dart'
    as _i26;
import 'package:medPilot/features/patient_portal/services/psych_social_clinic/cubit/psych_social_cubit.dart'
    as _i55;
import 'package:medPilot/features/patient_portal/services/psych_social_clinic/repository/psych_social_repository.dart'
    as _i47;
import 'package:medPilot/features/patient_portal/services/psych_social_clinic/repository/psych_social_repository_imp.dart'
    as _i46;
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/cubit/rehab_pall_cubit.dart'
    as _i43;
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/repository/rehab_pall_repository.dart'
    as _i37;
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/repository/rehab_pall_repository_imp.dart'
    as _i36;
import 'package:medPilot/features/patient_portal/services/repository/service_repository.dart'
    as _i11;
import 'package:medPilot/features/patient_portal/services/repository/service_repository_imp.dart'
    as _i12;
import 'package:medPilot/features/patient_portal/services/upload_document/cubit/document_cubit.dart'
    as _i25;
import 'package:medPilot/features/patient_portal/services/wound_clinic/cubit/woundClinic_cubit.dart'
    as _i27;
import 'package:medPilot/features/profile/cubit/profile_cubit.dart' as _i51;
import 'package:medPilot/features/profile/repository/profile_repository.dart'
    as _i39;
import 'package:medPilot/features/profile/repository/profile_repository_imp.dart'
    as _i38;
import 'package:medPilot/features/staff_portal/attendence/cubit/attendance_cubit.dart'
    as _i30;
import 'package:medPilot/features/staff_portal/medicine_alert/cubit/medicine_alert_cubit.dart'
    as _i29;
import 'package:medPilot/features/staff_portal/pescription/cubit/staff_prescription_cubit.dart'
    as _i33;
import 'package:medPilot/features/staff_portal/repository/staffPortal_repository.dart'
    as _i13;
import 'package:medPilot/features/staff_portal/repository/staffPortal_repository_imp.dart'
    as _i14;
import 'package:medPilot/features/staff_portal/roaster/cubit/roster_cubit.dart'
    as _i31;
import 'package:medPilot/features/staff_portal/task/cubit/task_cubit.dart'
    as _i32;
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
  gh.factory<_i13.StaffPortalRepository>(
      () => _i14.StaffPortalRepositoryImp(apiRequest: gh<_i10.ApiRequest>()));
  gh.factory<_i15.ChatRepository>(
      () => _i16.ChatRepositoryImp(apiRequest: gh<_i10.ApiRequest>()));
  gh.factory<_i17.CartRepository>(
      () => _i18.CartRepositoryImp(apiRequest: gh<_i10.ApiRequest>()));
  gh.factory<_i19.OnDemandServiceRepository>(() =>
      _i20.OnDemandServiceRepositoryImp(apiRequest: gh<_i10.ApiRequest>()));
  gh.factory<_i21.HomeRepository>(
      () => _i22.HomeRepositoryImp(apiRequest: gh<_i10.ApiRequest>()));
  gh.factory<_i23.FollowUpCubit>(
      () => _i23.FollowUpCubit(gh<_i11.ServiceRepository>()));
  gh.factory<_i24.ServiceCubit>(
      () => _i24.ServiceCubit(gh<_i11.ServiceRepository>()));
  gh.factory<_i25.DocumentCubit>(
      () => _i25.DocumentCubit(gh<_i11.ServiceRepository>()));
  gh.factory<_i26.PainClinicCubit>(
      () => _i26.PainClinicCubit(gh<_i11.ServiceRepository>()));
  gh.factory<_i27.WoundClinicCubit>(
      () => _i27.WoundClinicCubit(gh<_i11.ServiceRepository>()));
  gh.factory<_i28.ApiClient>(() => _i28.ApiClient(gh<_i5.Dio>()));
  gh.factory<_i29.MedicineAlertCubit>(
      () => _i29.MedicineAlertCubit(gh<_i13.StaffPortalRepository>()));
  gh.factory<_i30.AttendanceCubit>(
      () => _i30.AttendanceCubit(gh<_i13.StaffPortalRepository>()));
  gh.factory<_i31.RosterCubit>(
      () => _i31.RosterCubit(gh<_i13.StaffPortalRepository>()));
  gh.factory<_i32.TaskCubit>(
      () => _i32.TaskCubit(gh<_i13.StaffPortalRepository>()));
  gh.factory<_i33.StaffPrescriptionCubit>(
      () => _i33.StaffPrescriptionCubit(gh<_i13.StaffPortalRepository>()));
  gh.factory<_i34.SignUpRepository>(
      () => _i35.SignUpRepositoryImp(apiRequest: gh<_i10.ApiRequest>()));
  gh.factory<_i36.RehabPallRepositoryImp>(
      () => _i37.RehabPallRepository(apiRequest: gh<_i10.ApiRequest>()));
  gh.factory<_i38.ProfileRepositoryImp>(
      () => _i39.ProfileRepository(apiClient: gh<_i28.ApiClient>()));
  gh.factory<_i40.HomeCubit>(() => _i40.HomeCubit(gh<_i21.HomeRepository>()));
  gh.factory<_i41.CartCubit>(() => _i41.CartCubit(gh<_i17.CartRepository>()));
  gh.factory<_i42.ChatCubit>(() => _i42.ChatCubit(gh<_i15.ChatRepository>()));
  gh.factory<_i43.RehabPallCubit>(
      () => _i43.RehabPallCubit(gh<_i36.RehabPallRepositoryImp>()));
  gh.factory<_i44.SignInRepositoryImp>(
      () => _i45.SignInRepository(apiClient: gh<_i28.ApiClient>()));
  gh.factory<_i46.PsychSocialRepositoryImp>(
      () => _i47.PsychSocialRepository(apiClient: gh<_i28.ApiClient>()));
  gh.factory<_i48.InvestigationRepositoryImp>(
      () => _i49.InvestigationRepository(apiClient: gh<_i28.ApiClient>()));
  gh.factory<_i50.OnDemandServiceCubit>(
      () => _i50.OnDemandServiceCubit(gh<_i19.OnDemandServiceRepository>()));
  gh.factory<_i51.ProfileCubit>(
      () => _i51.ProfileCubit(gh<_i38.ProfileRepositoryImp>()));
  gh.factory<_i52.ForgotPasswordRepositoryImp>(
      () => _i53.ForgotPasswordRepository(apiClient: gh<_i28.ApiClient>()));
  gh.factory<_i54.ForgotPasswordCubit>(
      () => _i54.ForgotPasswordCubit(gh<_i52.ForgotPasswordRepositoryImp>()));
  gh.factory<_i55.PsychSocialCubit>(
      () => _i55.PsychSocialCubit(gh<_i46.PsychSocialRepositoryImp>()));
  gh.factory<_i56.SignInCubit>(
      () => _i56.SignInCubit(gh<_i44.SignInRepositoryImp>()));
  gh.factory<_i57.InvestigationCubit>(
      () => _i57.InvestigationCubit(gh<_i48.InvestigationRepositoryImp>()));
  return getIt;
}

class _$AppModule extends _i58.AppModule {}
