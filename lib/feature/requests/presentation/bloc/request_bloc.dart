import 'dart:async';

import 'package:beiti_care/feature/requests/domain/use_case/cancel_session_use_case.dart';
import 'package:beiti_care/feature/requests/domain/use_case/confirm_session_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/models/page_state/bloc_status.dart';
import '../../../../common/models/page_state/page_state.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/session_model.dart';
import '../../domain/use_case/client_request_use_case.dart';


part 'request_event.dart';

part 'request_state.dart';

@injectable
class RequestBloc extends Bloc<RequestEvent, RequestState> {

  final ClientRequestUseCase clientRequestUseCase;
final CancelSessionUseCase cancelSessionUseCase;
final ConfirmSessionUseCase confirmSessionUseCase;
  RequestBloc(

      this.clientRequestUseCase, this.cancelSessionUseCase, this.confirmSessionUseCase,
)
      : super(const RequestState()) {

    on<RequestClientEvent>(_onRequestClientEvent);
    on<CancelSessionEvent>(_onCancelSessionEvent);
    on<AcceptSessionEvent>(_onConfirmSessionEvent);


  }
  FutureOr<void> _onConfirmSessionEvent(
      AcceptSessionEvent event, Emitter<RequestState> emit) async {
    emit(state.copyWith(acceptSession: const PageState.loading()));

    final result = await confirmSessionUseCase(event.id);
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          acceptSession: PageState.loaded(data: data.data),
        ));
        event.onSuccess();

      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          acceptSession: PageState.error(exception: exception, message: message),
        ));
    }
  }
  FutureOr<void> _onCancelSessionEvent(
      CancelSessionEvent event, Emitter<RequestState> emit) async {
    emit(state.copyWith(cancelSession: const PageState.loading()));

    final result = await cancelSessionUseCase(event.id);
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          cancelSession: PageState.loaded(data: data.data),
        ));
event.onSuccess();
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          cancelSession: PageState.error(exception: exception, message: message),
        ));
    }
  }




  FutureOr<void> _onRequestClientEvent(
      RequestClientEvent event, Emitter<RequestState> emit) async {
    emit(state.copyWith(clientRequest: const PageState.loading()));

    final result = await clientRequestUseCase(NoParams());
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
          clientRequest: PageState.loaded(data: data.data),
        ));

      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          clientRequest: PageState.error(exception: exception, message: message),
        ));
    }
  }

}
