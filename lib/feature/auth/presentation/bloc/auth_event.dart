part of 'auth_bloc.dart';

@immutable
class AuthEvent {}









class RegisterEvent extends AuthEvent{
  final RegisterParam param;
  final VoidCallback onSuccess;
  RegisterEvent({required this.param,required this.onSuccess});
}

class LoginEvent extends AuthEvent{
  final LoginParam param;

  final VoidCallback onSuccess;
  LoginEvent({required this.param,required this.onSuccess});
}

class LogoutEvent extends AuthEvent{
  final VoidCallback onSuccess;
  final VoidCallback onFailure;
  LogoutEvent({required this.onSuccess,required this.onFailure});

}

class ForgetPasswordEvent extends AuthEvent{
  final String email;
  final VoidCallback onSuccess;
  ForgetPasswordEvent({required this.email,required this.onSuccess});

}


class VerifyEvent extends AuthEvent{
 final String param;
 final VoidCallback onSuccess;
  VerifyEvent({required this.param,required this.onSuccess});

}



class ResetPasswordEvent extends AuthEvent{
  final ResetPassowrdParam param;
  final VoidCallback onSuccess;
  ResetPasswordEvent({required this.param,required this.onSuccess});

}