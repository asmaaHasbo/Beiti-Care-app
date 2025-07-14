part of 'asmaa_profile_cubit.dart';

@immutable
sealed class AsmaaProfileState {}

final class AsmaaProfileInitial extends AsmaaProfileState {}

//------------------ getting data from api state --------------
final class GetUserDataSuccessState extends AsmaaProfileState {
 final UserProfileModel userProfileModel;
  GetUserDataSuccessState({required this.userProfileModel});
}

final class GetUserDataLoadingState extends AsmaaProfileState {}

final class GetUserDataFailureState extends AsmaaProfileState {
  final String errorMsg;

  GetUserDataFailureState({required this.errorMsg});
}


//------------------ pic image from gallery state --------------
final class UpdateUserProfileSuccessState extends AsmaaProfileState {
  final UserProfileModel userProfileModel;
  UpdateUserProfileSuccessState({required this.userProfileModel});
}

final class UpdateUserProfileLoadingState extends AsmaaProfileState {}

final class UpdateUserProfileFailureState extends AsmaaProfileState {
  final String errorMsg;
  UpdateUserProfileFailureState({required this.errorMsg});
}
