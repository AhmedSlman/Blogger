import 'package:blogger/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:blogger/features/auth/data/repository/auth_repository_imple.dart';
import 'package:blogger/features/auth/domain/repository/auth_repository.dart';
import 'package:blogger/features/auth/domain/usecases/user_login.dart';
import 'package:blogger/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blogger/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/utils/app_constants.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    anonKey: AppConastants.supabaseAnonKey,
    url: AppConastants.supabaseUrl,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  // registerFactory هنا عشان كل مره بعمل data source غير اللي قبله
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImple(serviceLocator()),
  );
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImple(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => UserSignUp(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => UserLogin(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userLogin: serviceLocator(),
    ),
  );
}
