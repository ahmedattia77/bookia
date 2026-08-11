part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final AuthRegisterResponseModel response;
  RegisterSuccessState(this.response);
}

class RegisterErrorState extends RegisterState {
  final String error;
  RegisterErrorState(this.error);
}
