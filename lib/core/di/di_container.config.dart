// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:beiti_care/core/api/client.dart';
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../feature/app/data/data_source/app_remote_data_source.dart';
import '../../feature/app/data/repo_imp/app_repository_imp.dart';
import '../../feature/app/domain/repo/app_repository.dart' as _i784;
import '../../feature/app/domain/repo/preferences_repository.dart' as _i935;
import '../../feature/app/presentation/bloc/app_bloc.dart' as _i313;
import '../../feature/auth/data/data_source/auth_remote_data_source.dart'
    as _i140;
import '../../feature/auth/data/repo_imp/auth_repository_imp.dart' as _i897;
import '../../feature/auth/domain/repo/auth_repository.dart' as _i767;
import '../../feature/auth/domain/use_case/forget_password_use_case.dart'
    as _i748;
import '../../feature/auth/domain/use_case/login_use_case.dart' as _i433;
import '../../feature/auth/domain/use_case/logout_use_case.dart' as _i309;
import '../../feature/auth/domain/use_case/register_nurse_use_case.dart'
    as _i499;
import '../../feature/auth/domain/use_case/reset_password_use_case.dart'
    as _i84;
import '../../feature/auth/domain/use_case/verify_use_case.dart' as _i144;
import '../../feature/auth/presentation/bloc/auth_bloc.dart' as _i466;
import '../../feature/profile/data/data_source/profile_remote_data_source.dart'
    as _i371;
import '../../feature/profile/data/repo_imp/profile_repository_imp.dart'
    as _i989;
import '../../feature/profile/domain/repo/profile_repository.dart' as _i1006;
import '../../feature/profile/domain/use_case/edit_profile_use_case.dart'
    as _i36;
import '../../feature/profile/domain/use_case/get_by_id_use_case.dart' as _i873;
import '../../feature/profile/presentation/bloc/profile_bloc.dart' as _i371;
import '../../feature/requests/data/data_source/request_remote_data_source.dart'
    as _i217;
import '../../feature/requests/data/repo_imp/request_repository_imp.dart'
    as _i533;
import '../../feature/requests/domain/repo/request_repository.dart' as _i130;
import '../../feature/requests/domain/use_case/cancel_session_use_case.dart'
    as _i464;
import '../../feature/requests/domain/use_case/client_request_use_case.dart'
    as _i348;
import '../../feature/requests/domain/use_case/confirm_session_use_case.dart'
    as _i1036;
import '../../feature/requests/presentation/bloc/request_bloc.dart' as _i538;
import '../api/client.dart' as _i265;
import 'di_container.dart' as _i198;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i361.BaseOptions>(() => appModule.dioOption);
  gh.factory<_i313.AppBloc>(() => _i313.AppBloc());
  gh.singleton<_i974.Logger>(() => appModule.logger);
  await gh.singletonAsync<_i460.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i361.Dio>(() => appModule.dio(
        gh<_i361.BaseOptions>(),
        gh<_i974.Logger>(),
      ));
  gh.factory<_i140.AuthRemoteDataSource>(
      () => _i140.AuthRemoteDataSource(gh<_i265.ClientApi>()));
  gh.factory<_i217.RequestRemoteDataSource>(
      () => _i217.RequestRemoteDataSource(gh<_i265.ClientApi>()));
  gh.factory<_i371.ProfileRemoteDataSource>(
      () => _i371.ProfileRemoteDataSource(gh<_i265.ClientApi>()));
  gh.factory<_i130.RequestRepository>(() => _i533.RequestRepositoryImpl(
      datasource: gh<_i217.RequestRemoteDataSource>()));
  gh.singleton<_i935.PreferencesRepository>(
      () => _i935.PreferencesRepository(gh<_i460.SharedPreferences>()));
  gh.factory<ClientApi>(() => ClientApi(gh<_i361.Dio>()));
  gh.factory<_i767.AuthRepository>(() =>
      _i897.AuthRepositoryImpl(datasource: gh<_i140.AuthRemoteDataSource>()));
  gh.factory<_i1006.ProfileRepository>(() => _i989.ProfileRepositoryImpl(
      datasource: gh<_i371.ProfileRemoteDataSource>()));
  gh.factory<_i348.ClientRequestUseCase>(
      () => _i348.ClientRequestUseCase(gh<_i130.RequestRepository>()));
  gh.factory<_i464.CancelSessionUseCase>(
      () => _i464.CancelSessionUseCase(gh<_i130.RequestRepository>()));
  gh.factory<_i1036.ConfirmSessionUseCase>(
      () => _i1036.ConfirmSessionUseCase(gh<_i130.RequestRepository>()));
  gh.factory<_i748.ForgetPasswordUseCase>(
      () => _i748.ForgetPasswordUseCase(gh<_i767.AuthRepository>()));
  gh.factory<_i433.LoginUseCase>(
      () => _i433.LoginUseCase(gh<_i767.AuthRepository>()));
  gh.factory<_i309.LogoutUseCase>(
      () => _i309.LogoutUseCase(gh<_i767.AuthRepository>()));
  gh.factory<_i84.ResetPasswordUseCase>(
      () => _i84.ResetPasswordUseCase(gh<_i767.AuthRepository>()));
  gh.factory<_i144.VerifyUseCase>(
      () => _i144.VerifyUseCase(gh<_i767.AuthRepository>()));
  gh.factory<_i499.RegisterUseCase>(
      () => _i499.RegisterUseCase(gh<_i767.AuthRepository>()));
  gh.factory<_i36.EditrUseCase>(
      () => _i36.EditrUseCase(gh<_i1006.ProfileRepository>()));
  gh.factory<_i873.GetProfileByIdUseCase>(
      () => _i873.GetProfileByIdUseCase(gh<_i1006.ProfileRepository>()));
  gh.factory<_i466.AuthBloc>(() => _i466.AuthBloc(
        gh<_i499.RegisterUseCase>(),
        gh<_i433.LoginUseCase>(),
        gh<_i309.LogoutUseCase>(),
        gh<_i748.ForgetPasswordUseCase>(),
        gh<_i144.VerifyUseCase>(),
        gh<_i84.ResetPasswordUseCase>(),
      ));
  gh.factory<AppRemoteDataSource>(() => AppRemoteDataSource(gh<ClientApi>()));
  gh.factory<_i538.RequestBloc>(() => _i538.RequestBloc(
        gh<_i348.ClientRequestUseCase>(),
        gh<_i464.CancelSessionUseCase>(),
        gh<_i1036.ConfirmSessionUseCase>(),
      ));
  gh.factory<_i784.AppRepository>(
      () => AppRepositoryImpl(gh<AppRemoteDataSource>()));
  gh.factory<_i371.ProfileBloc>(() => _i371.ProfileBloc(
        gh<_i36.EditrUseCase>(),
        gh<_i873.GetProfileByIdUseCase>(),
      ));
  return getIt;
}

class _$AppModule extends _i198.AppModule {}
