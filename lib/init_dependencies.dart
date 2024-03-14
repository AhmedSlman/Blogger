import 'package:blogger/core/commen/cubits/appUserCubit/app_user_cubit.dart';
import 'package:blogger/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:blogger/features/auth/data/repository/auth_repository_imple.dart';
import 'package:blogger/features/auth/domain/repository/auth_repository.dart';
import 'package:blogger/features/auth/domain/usecases/current_user.dart';
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
  serviceLocator.registerLazySingleton<AppUserCubit>(
    () => AppUserCubit(),
  );
}

void _initAuth() {
  // Datasource
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImple(
        serviceLocator(),
      ),
    )
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImple(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserSignUp(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserLogin(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CurrentUser(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}
