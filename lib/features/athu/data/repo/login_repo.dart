import 'package:bookia/core/constants/api/api_constants.dart';
import 'package:bookia/features/athu/data/model/auth_login_response_model.dart';
import 'package:dio/dio.dart';

class LoginRepo {
  final Dio dio;

  LoginRepo(this.dio);

  Future<AuthLoginResponseModel> login({
    required AuthLoginRequestModel requstModel,
  }) async {
    final response = await dio.post(
      ApiConstants.loginEndpoint,
      data: {'email': requstModel.email, 'password': requstModel.password},
    );
    return AuthLoginResponseModel.fromJson(response.data);
  }

  // Future<AuthLoginResponseModel> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   final response = await dio.post(
  //     ApiConstants.loginEndpoint,
  //     data: {'email': email, 'password': password},
  //   );
  //   return AuthLoginResponseModel.fromJson(response.data);
  // }
}
