part of 'profile_bloc.dart';

@immutable
class ProfileState {
  //!Register Status


  //!Login Status
  final PageState<UserModel> getProfile;
  final BlocStatus editProfile;

  const ProfileState({
    //!Register Status

    this.editProfile=const BlocStatus.initial(),

    //!Login Status
    this.getProfile=const PageState.init(),

    });

  ProfileState copyWith({
    //!Register Status

    final BlocStatus? editProfile,


    //!Login Status
    final PageState<UserModel>? getProfile,


}) {
    return ProfileState(



      getProfile: getProfile??this.getProfile,

      //!Login Status
      editProfile: editProfile??this.editProfile,

    );
  }
}
