part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  _initAuth();
  _initBlog();
  final supabase = await Supabase.initialize(
    anonKey: AppConastants.supabaseAnonKey,
    url: AppConastants.supabaseUrl,
  );
  Hive.defaultDirectory = (await getApplicationCacheDirectory()).path;
  serviceLocator.registerLazySingleton(() => Hive.box(name: "blogs"));
  serviceLocator.registerFactory(() => InternetConnection());
  serviceLocator.registerLazySingleton(() => supabase.client);
  serviceLocator.registerLazySingleton<AppUserCubit>(
    () => AppUserCubit(),
  );
  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImple(
      serviceLocator(),
    ),
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

void _initBlog() {
  serviceLocator
    ..registerFactory<BlogRemoteDataSource>(
      () => BlogRemoteDataSourceImple(
        serviceLocator(),
      ),
    )
    ..registerFactory<BlogLocalDataSource>(
      () => BlogLocalDataSourceImple(
        serviceLocator(),
      ),
    )
    ..registerFactory<BlogRepository>(
      () => BlogRepositoryImple(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UploadBlog(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetAllBlogs(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => BlogBloc(
        uploadBlog: serviceLocator(),
        getAllBlogs: serviceLocator(),
      ),
    );
}
