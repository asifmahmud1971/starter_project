import 'package:demo/features/screens/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:demo/features/screens/home/cubit/home_cubit.dart';
import 'package:demo/features/screens/no_internet/cubit/internet_cubit.dart';
import 'package:demo/features/screens/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/screens/auth/sign_up/cubit/sign_up_cubit.dart';
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

    // =========== [ Auth End ] ===========
  ];
}
