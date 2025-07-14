part of 'request_bloc.dart';

@immutable
class RequestState {
  //!Register Status


  //!Login Status
  final PageState<SessionsResponse> clientRequest;
  final PageState<bool> cancelSession;
  final PageState<bool> acceptSession;

  const RequestState({
    //!Register Status

    //!Login Status
    this.cancelSession=const PageState.init(),
    this.acceptSession=const PageState.init(),

    this.clientRequest=const PageState.init(),

    });

  RequestState copyWith({
    //!Register Status

    final PageState<bool> ?cancelSession,
    final PageState<bool> ?acceptSession,
    //!Login Status
    final PageState<SessionsResponse>? clientRequest,
    final BlocStatus? logout,

}) {
    return RequestState(

      acceptSession:acceptSession??this.acceptSession,
      cancelSession:cancelSession??this.cancelSession,
      clientRequest: clientRequest??this.clientRequest,


    );
  }
}
