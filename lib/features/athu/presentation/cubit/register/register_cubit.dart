import 'package:bloc/bloc.dart';
import 'package:bookia/features/athu/data/model/auth_register_response_model.dart';
import 'package:bookia/features/athu/data/use_case/register_use_case.dart';
import 'package:flutter/material.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterInitialState());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;

    emit(RegisterLoadingState());

    try {
      final requestModel = AuthRegisterRequestModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      );

      final response = await registerUseCase.call(requestModel: requestModel);

      if (response.status == 201 || response.status == 200) {
        emit(RegisterSuccessState(response));
      } else {
        emit(RegisterErrorState(response.message ?? 'failed to register'));
      }
    } catch (e) {
      emit(RegisterErrorState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    return super.close();
  }
}
