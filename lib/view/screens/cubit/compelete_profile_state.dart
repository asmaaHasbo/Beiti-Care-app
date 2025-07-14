part of 'compelete_profile_cubit.dart';

@immutable
sealed class CompeleteProfileState {}

final class CompeleteProfileInitial extends CompeleteProfileState {}

final class CompeleteProfileLoading extends CompeleteProfileState {}

final class CompeleteProfileLoaded extends CompeleteProfileState {
  CompeleteProfileLoaded();
}
final class CompeleteProfileError extends CompeleteProfileState {
  final String errorMessage;
  CompeleteProfileError(this.errorMessage);
}