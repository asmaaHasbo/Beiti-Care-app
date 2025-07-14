part of 'profile_bloc.dart';

@immutable
class ProfileEvent {}









class EditProfileEvent extends ProfileEvent{
  final RegisterParam param;
  final VoidCallback onSuccess;
  EditProfileEvent({required this.param,required this.onSuccess});
}

class GetProfileEvent extends ProfileEvent{


  GetProfileEvent();
}

