import 'dart:async';

import 'package:beiti_care/feature/profile/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/models/page_state/bloc_status.dart';
import '../../../../common/models/page_state/page_state.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';

import '../../domain/use_case/edit_profile_use_case.dart' show EditrUseCase, RegisterParam;
import '../../domain/use_case/get_by_id_use_case.dart';


part 'profile_event.dart';

part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final EditrUseCase editrUseCase;
  final GetProfileByIdUseCase getProfileByIdUseCase;

  ProfileBloc(
      this.editrUseCase, this.getProfileByIdUseCase)
      : super(const ProfileState()) {

    on<EditProfileEvent>(_onEditProfileEvent);
    on<GetProfileEvent>(_onGetProfileEvent);

  }


  FutureOr<void> _onEditProfileEvent(
      EditProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(editProfile: const BlocStatus.loading()));

    final result = await editrUseCase(
       event.param);
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          editProfile: const BlocStatus.success(),
        ));
        event.onSuccess();
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          editProfile: BlocStatus.fail(error: message),
        ));
    }
  }

  FutureOr<void> _onGetProfileEvent(
      GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(getProfile: const PageState.loading()));

    final result = await getProfileByIdUseCase(
      NoParams());
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          getProfile: PageState.loaded(data: data.data),
        ));

      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          getProfile: PageState.error(exception: exception, message: message),
        ));
    }
  }



}
