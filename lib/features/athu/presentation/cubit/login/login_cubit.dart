import 'package:bloc/bloc.dart';
import 'package:bookia/core/services/local_storage_service.dart';
import 'package:bookia/features/athu/data/model/auth_login_response_model.dart';
import 'package:bookia/features/athu/data/use_case/login_use_case.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitialState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // data model to hold the requst data for login.
  late final AuthLoginRequestModel requestModel;

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    emit(LoginLoadingState());

    try {
      requestModel = AuthLoginRequestModel(
        email: emailController.text,
        password: passwordController.text,
      );
      final response = await loginUseCase.call(requestMpdel: requestModel);
      if (response.status == 200) {
        LocalStorageService.saveUserToken(
          userToken: response.data?.token ?? '',
        );
        emit(LoginSuccessState(response));
      }
    } catch (errorMassage) {
      emit(LoginErrorState(errorMassage.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
