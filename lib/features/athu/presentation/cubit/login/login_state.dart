part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final AuthLoginResponseModel response;
  LoginSuccessState(this.response);
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}
