import 'package:bookia/core/constants/api/api_constants.dart';
import 'package:bookia/features/athu/data/model/auth_register_response_model.dart';
import 'package:dio/dio.dart';

class RegisterRepo {
  final Dio dio;

  RegisterRepo(this.dio);

  Future<AuthRegisterResponseModel> register({
    required AuthRegisterRequestModel requestModel,
  }) async {
    final response = await dio.post(
      ApiConstants.registerEndpoint,
      data: requestModel.toJson(),
    );
    return AuthRegisterResponseModel.fromJson(response.data);
  }
}
