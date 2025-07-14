part of 'clint_id_cubit.dart';

@immutable
sealed class ClintIdState {}

final class ClintIdInitial extends ClintIdState {}

final class ClintIdLoading extends ClintIdState {}

final class ClintIdLoaded extends ClintIdState {
  final SessionResponse sessionResponse;
  ClintIdLoaded(this.sessionResponse);
}

final class ClintIdError extends ClintIdState {
  final String errorMessage;
  ClintIdError(this.errorMessage);
}