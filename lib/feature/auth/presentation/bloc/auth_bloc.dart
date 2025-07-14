import 'dart:async';

import 'package:beiti_care/core/di/di_container.dart';
import 'package:beiti_care/feature/app/domain/repo/preferences_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'dart:io';

import '../../../../common/models/page_state/bloc_status.dart';
import '../../../../common/models/page_state/page_state.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/login_model.dart';

import '../../domain/use_case/forget_password_use_case.dart';
import '../../domain/use_case/login_use_case.dart';
import '../../domain/use_case/logout_use_case.dart';
import '../../domain/use_case/register_nurse_use_case.dart';
import '../../domain/use_case/reset_password_use_case.dart';
import '../../domain/use_case/verify_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;
  final LoginUseCase loginUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final VerifyUseCase verifyUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  AuthBloc(this.registerUseCase, this.loginUseCase, this.logoutUseCase,
      this.forgetPasswordUseCase, this.verifyUseCase, this.resetPasswordUseCase)
      : super(const AuthState()) {
    on<RegisterEvent>(_onRegisterEvent);
    on<LoginEvent>(_onLoginEvent);
    on<LogoutEvent>(_onLogoutEvent);
    on<ForgetPasswordEvent>(_onForgetPasswordEvent);
    on<VerifyEvent>(_onVerifyEvent);
    on<ResetPasswordEvent>(_onResetPasswordEvent);
  }

  FutureOr<void> _onResetPasswordEvent(
      ResetPasswordEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(resetPasswordStatus: const BlocStatus.loading()));

    final result = await resetPasswordUseCase(event.param);
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          resetPasswordStatus: const BlocStatus.success(),
        ));
        event.onSuccess();
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          resetPasswordStatus: BlocStatus.fail(error: message),
        ));
    }
  }

  FutureOr<void> _onVerifyEvent(
      VerifyEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(verify: const BlocStatus.loading()));

    final result = await verifyUseCase(event.param);
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          verify: const BlocStatus.success(),
        ));
        event.onSuccess();
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          verify: BlocStatus.fail(error: message),
        ));
    }
  }

  FutureOr<void> _onRegisterEvent(
      RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(register: const BlocStatus.loading()));

    final result = await registerUseCase(RegisterParam(
        isShowInJOb: event.param.isShowInJOb,
        name: event.param.name,
        email: event.param.email,
        password: event.param.password,
        typeId: event.param.typeId,
        specializationId: event.param.specializationId,
        nationalityId: event.param.nationalityId,
        gender: event.param.gender,
        cityId: event.param.cityId,
        mobileNumber: event.param.mobileNumber,
        workName: event.param.workName,
        workAddress: event.param.workAddress,
        longitude: event.param.longitude,
        latitude: event.param.latitude,
        additionalInfo: event.param.additionalInfo,
        birthDate: event.param.birthDate,
        birthPlace: event.param.birthPlace,
        expertiseYears: event.param.expertiseYears,
        showMobileNumber: event.param.showMobileNumber,
        image: event.param.image));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          register: const BlocStatus.success(),
        ));
        event.onSuccess();
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          register: BlocStatus.fail(error: message),
        ));
    }
  }

  FutureOr<void> _onLoginEvent(
      LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loginStatus: const PageState.loading()));

    final result = await loginUseCase(LoginParam(
      email: event.param.email,
      password: event.param.password,

    ));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          loginStatus: PageState.loaded(data: data.data),
        ));


        String? id = await getIt<PreferencesRepository>().getString('idUser');

        // print('++++++++++++++++++');
        //
        // print(id);
        // print('++++++++++++++++++');
        //
        // print('asmaaa this is id ' + data.data.user.id);

        event.onSuccess();

      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          loginStatus: PageState.error(exception: exception, message: message),
        ));
    }
  }

  // FutureOr<void> _onLoginEvent(
  //     LoginEvent event, Emitter<AuthState> emit, ) async {
  //   emit(state.copyWith(loginStatus: const PageState.loading()));
  //
  //   final result = await loginUseCase(LoginParam(
  //     email: event.param.email,
  //     password: event.param.password,
  //   ));
  //
  //   switch (result) {
  //     case Success(value: final data):
  //       final userType = data.data.user.role;
  //       final userId = data.data.user.id;
  //
  //
  //       // Emit based on user type
  //       if (userType == 'client') {
  //         emit(state.copyWith(
  //           loginStatus: PageState.loaded(data: data.data),
  //                 // String? id = await getIt<PreferencesRepository>().getString('idUser');
  //
  //           // patientId: userId,
  //           //   userId: 'id';
  //         ));
  //       } else if (userType == 'nurse') {
  //         emit(state.copyWith(
  //           loginStatus: PageState.loaded(data: data.data),
  //             // userId: 'id';
  //
  //           // nurseId: userId,
  //         ));
  //       } else {
  //         emit(state.copyWith(
  //           loginStatus: PageState.error(
  //             message: "Unknown user type", exception: null,
  //           ),
  //         ));
  //         return;
  //       }
  //
  //       event.onSuccess();
  //
  //     case Failure(exception: final exception, message: final message):
  //       emit(state.copyWith(
  //         loginStatus: PageState.error(exception: exception, message: message),
  //       ));
  //   }
  // }




  FutureOr<void> _onLogoutEvent(
      LogoutEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(logout: const BlocStatus.loading()));

    final result = await logoutUseCase(NoParams());
    switch (result) {
      case Success(value: final data):
        event.onSuccess();
        emit(state.copyWith(
          logout: const BlocStatus.success(),
        ));
      case Failure(exception: final exception, message: final message):
        event.onFailure();
        emit(state.copyWith(
          logout: BlocStatus.fail(error: message),
        ));
    }
  }

  FutureOr<void> _onForgetPasswordEvent(
      ForgetPasswordEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(forgetPasswordStatus: const BlocStatus.loading()));

    final result = await forgetPasswordUseCase(event.email);
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          forgetPasswordStatus: const BlocStatus.success(),
        ));
        event.onSuccess();
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          forgetPasswordStatus: BlocStatus.fail(error: message),
        ));
    }
  }
}
