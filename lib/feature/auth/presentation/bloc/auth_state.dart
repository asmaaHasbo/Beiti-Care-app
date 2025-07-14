part of 'auth_bloc.dart';

@immutable
class AuthState {
  //!Register Status

  final BlocStatus forgetPasswordStatus;
  final BlocStatus resetPasswordStatus;
  final BlocStatus register;



  //!Login Status
  final PageState<LoginModel> loginStatus;
  final BlocStatus logout;
  final BlocStatus verify;



  const AuthState({
    //!Register Status

    this.register=const BlocStatus.initial(),
    this.forgetPasswordStatus=const BlocStatus.initial(),
    this.resetPasswordStatus=const BlocStatus.initial(),
    this.verify=const BlocStatus.initial(),
    //!Login Status
    this.logout=const BlocStatus.initial(),
    this.loginStatus=const PageState.init(),

    });

  AuthState copyWith({
    //!Register Status

    final BlocStatus? forgetPasswordStatus,
    final BlocStatus? resetPasswordStatus,


    final BlocStatus? register,
    final BlocStatus? verify,

    //!Login Status
    final PageState<LoginModel>? loginStatus,
    final BlocStatus? logout,

}) {
    return AuthState(



      register: register??this.register,

      //!Login Status
      loginStatus: loginStatus??this.loginStatus,
      logout: logout?? this.logout,
      forgetPasswordStatus: forgetPasswordStatus??this.forgetPasswordStatus,
      verify: verify??this.verify,

      resetPasswordStatus:  resetPasswordStatus??this.resetPasswordStatus,
    );
  }
}
