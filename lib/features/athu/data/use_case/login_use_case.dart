import 'package:bookia/features/athu/data/model/auth_login_response_model.dart';

import '../repo/login_repo.dart';

class LoginUseCase {
  final LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

  Future<AuthLoginResponseModel> call({
    required AuthLoginRequestModel requestMpdel,
  }) async {
    return await loginRepo.login(requstModel: requestMpdel);
  }
}
