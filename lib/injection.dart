import 'package:api_project/cubit/my_cubit.dart';
import 'package:api_project/repos/my_repo.dart';
import 'package:api_project/services/web_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(() => WebServices(Dio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = (1 * 1000) as Duration?
    ..options.receiveTimeout = (1 * 1000) as Duration?;
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    responseBody: true,
  ));
  return dio;
}
