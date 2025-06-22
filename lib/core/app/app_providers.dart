import 'package:medPilot/features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:medPilot/features/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:medPilot/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:medPilot/features/no_internet/cubit/internet_cubit.dart';
import 'package:medPilot/features/patient_portal/home/cubit/home_cubit.dart';
import 'package:medPilot/features/patient_portal/services/cubit/services_cubit.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/cubit/followup_cubit.dart';
import 'package:medPilot/features/patient_portal/services/invesigation/cubit/investigation_cubit.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/cubit/painClinic_cubit.dart';
import 'package:medPilot/features/patient_portal/services/psych_social_clinic/cubit/psych_social_cubit.dart';
import 'package:medPilot/features/patient_portal/services/upload_document/cubit/document_cubit.dart';
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/cubit/rehab_pall_cubit.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/cubit/woundClinic_cubit.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/cubit/medicine_alert_cubit.dart';
import 'package:medPilot/features/staff_portal/roaster/cubit/roster_cubit.dart';
import 'package:medPilot/features/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/sign_up/cubit/sign_up_cubit.dart';
import '../../features/patient_portal/on_demand_service/cubit/onDemand_service_cubit.dart';
import '../../features/profile/cubit/profile_cubit.dart';
import 'app_dependency.dart';

class AppProviders {
  static final providers = <BlocProvider>[
    BlocProvider<ThemeCubit>(
        create: (BuildContext context) => instance<ThemeCubit>()),
    BlocProvider<InternetCubit>(
        create: (BuildContext context) => instance<InternetCubit>()),
    BlocProvider<HomeCubit>(
      create: (BuildContext context) => instance<HomeCubit>(),
    ),

    // =========== [ Auth Start ] ===========
    BlocProvider<SignInCubit>(
      create: (BuildContext context) => instance<SignInCubit>(),
    ),

    BlocProvider<SignUpCubit>(
      create: (BuildContext context) => instance<SignUpCubit>(),
    ),
    BlocProvider<ServiceCubit>(
      create: (BuildContext context) => instance<ServiceCubit>(),
    ),
    BlocProvider<DashboardCubit>(
      create: (BuildContext context) => instance<DashboardCubit>(),
    ),
    BlocProvider<ProfileCubit>(
      create: (BuildContext context) => instance<ProfileCubit>(),
    ),
    BlocProvider<FollowUpCubit>(
      create: (BuildContext context) => instance<FollowUpCubit>(),
    ),
    BlocProvider<PainClinicCubit>(
      create: (BuildContext context) => instance<PainClinicCubit>(),
    ),
    BlocProvider<WoundClinicCubit>(
      create: (BuildContext context) => instance<WoundClinicCubit>(),
    ),
    BlocProvider<DocumentCubit>(
      create: (BuildContext context) => instance<DocumentCubit>(),
    ),

    BlocProvider<RehabPallCubit>(
      create: (BuildContext context) => instance<RehabPallCubit>(),
    ),
    BlocProvider<ForgotPasswordCubit>(
      create: (BuildContext context) => instance<ForgotPasswordCubit>(),
    ),

    BlocProvider<InvestigationCubit>(
      create: (BuildContext context) => instance<InvestigationCubit>(),
    ),

    BlocProvider<OnDemandServiceCubit>(
      create: (BuildContext context) => instance<OnDemandServiceCubit>(),
    ),
    BlocProvider<PsychSocialCubit>(
      create: (BuildContext context) => instance<PsychSocialCubit>(),
    ),
    // =========== [ Auth End ] ===========
    BlocProvider<RosterCubit>(
      create: (BuildContext context) => instance<RosterCubit>(),
    ),
    // =========== [ Auth End ] ===========
    BlocProvider<MedicineAlertCubit>(
      create: (BuildContext context) => instance<MedicineAlertCubit>(),
    ),
    // =========== [ Auth End ] ===========


  ];
}
