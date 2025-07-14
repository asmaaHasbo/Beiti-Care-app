import 'package:beiti_care/feature/app/presentation/bloc/app_bloc.dart';
import 'package:beiti_care/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:beiti_care/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:beiti_care/view/asmaa_api/dio_consumer.dart';
import 'package:beiti_care/view/asmaa_response/cubit/response_cubit.dart';
import 'package:beiti_care/view/cubit/asmaa_profile_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../feature/requests/presentation/bloc/request_bloc.dart';

class ServiceProvider extends StatelessWidget {
  const ServiceProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<AppBloc>()),
        BlocProvider(create: (_) => GetIt.I<AuthBloc>()),
        BlocProvider(create: (_) => GetIt.I<ProfileBloc>()),
        BlocProvider(create: (_) => GetIt.I<RequestBloc>()),
        BlocProvider(
          create: (context) =>
              AsmaaProfileCubit(DioConsumer())..getUserProfileData(),
        ),
        BlocProvider(
          create: (context) => ResponseCubit(DioConsumer()),
        ),
        
      ],
      child: child,
    );
  }

  final Widget child;
}
