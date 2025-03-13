import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/point/data/datasources/user_remote_data_source.dart';
import 'features/point/data/repositories/user_repository_impl.dart';
import 'features/point/domain/repositories/user_repository.dart';
import 'features/point/domain/usecases/get_user_data.dart';
import 'features/point/domain/usecases/get_verify_otp_data.dart';
import 'features/point/presentation/providers/user_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerFactory(() => UserProvider(
    getUserDataUseCase: sl(),
    getVerifyOtpDataUseCase: sl()
  ));


  sl.registerLazySingleton<GetUserData>(
      () => GetUserData(userRepository: sl()));
  sl.registerLazySingleton<GetVerifyOtpData>(
      () => GetVerifyOtpData(userRepository: sl()));


  sl.registerFactory<UserRepository>(
      () => UserRepositoryImpl(userRemoteDataSource: sl()));

  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));
      
  sl.registerLazySingleton(() => Dio());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
