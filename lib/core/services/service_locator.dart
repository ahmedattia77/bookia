import 'package:bookia/core/constants/api/api_constants.dart';
import 'package:bookia/features/athu/data/repo/register_repo.dart';
import 'package:bookia/features/athu/data/use_case/login_use_case.dart';
import 'package:bookia/features/athu/data/use_case/register_use_case.dart';
import 'package:bookia/features/athu/presentation/cubit/register/register_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../features/athu/data/repo/login_repo.dart';
import '../../features/athu/presentation/cubit/login/login_cubit.dart';

final getIt = GetIt.instance;
// one shared instance of Dio, LoginRepo
//, LoginUseCase, and LoginCubit will be created and used
// throughout the app
//with lazy singleton, the instance will be created only when it is first requested
void setupServiceLocator() {
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {'Accept': 'application/json'},
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          if (options.path.contains('/posts')) {
            return false;
          }
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
    return dio;
  });

  // provide the login repo and use case to the cubit,
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<Dio>()));

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<LoginRepo>()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginUseCase>()));

  // provide the register repo and use case to the cubit,

  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt<Dio>()));

  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<RegisterRepo>()),
  );

  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterUseCase>()),
  );
}
