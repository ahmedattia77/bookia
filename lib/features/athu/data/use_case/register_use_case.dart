import 'package:bookia/features/athu/data/model/auth_register_response_model.dart';
import 'package:bookia/features/athu/data/repo/register_repo.dart';

class RegisterUseCase {
  RegisterRepo registerRepo;
  RegisterUseCase(this.registerRepo);

  Future<AuthRegisterResponseModel> call({
    required AuthRegisterRequestModel requestModel,
  }) async {
    return await registerRepo.register(requestModel: requestModel);
  }
}
