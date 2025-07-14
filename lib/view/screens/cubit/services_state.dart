part of 'services_cubit.dart';

@immutable
sealed class ServicesState {}

final class ServicesInitial extends ServicesState {}

final class ServicesLoading extends ServicesState {}

final class ServicesLoaded extends ServicesState {
  final List<ServiceModel> services;

  ServicesLoaded(this.services);
}
final class ServicesError extends ServicesState {
  final String errorMessage;

  ServicesError(this.errorMessage);
}