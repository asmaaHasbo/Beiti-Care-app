part of 'requests_cubit.dart';

@immutable
sealed class RequestsState {}

final class RequestsInitial extends RequestsState {}
final class RequestsLoading extends RequestsState {}
final class RequestsLoaded extends RequestsState {
final List<SessionModel> requestsList;
  final List<SessionModel> weeklyRequests;
  final List<SessionModel> monthlyRequests;
  final List<SessionModel> annualRequests;

  RequestsLoaded({
    required this.requestsList,
    required this.weeklyRequests,
    required this.monthlyRequests,
    required this.annualRequests,
  });
}

final class RequestsError extends RequestsState {
  final String message;
  RequestsError(this.message);
}
final class LoadingCreateRequest extends RequestsState {}
final class CreatedRequestState extends RequestsState {}