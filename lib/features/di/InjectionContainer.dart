import 'package:clean_architect/features/data/api/api_client.dart';
import 'package:clean_architect/features/data/repositories/app_repository_impl.dart';
import 'package:clean_architect/features/data/repositories/auth_repo.dart';
import 'package:clean_architect/features/data/repositories/splash_repo.dart';
import 'package:clean_architect/features/domain/repositories/AppRepository.dart';
import 'package:clean_architect/features/domain/usecases/GetPreferredLanguageUseCase.dart';
import 'package:clean_architect/features/domain/usecases/UpdateLanguageUseCase.dart';
import 'package:clean_architect/features/presentation/blocs/LanguageBloc.dart';
import 'package:clean_architect/features/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../core/env/config.dart';
import '../../core/network/http_client.dart';
import '../data/datasource/binding/cache/shared_pref.dart';
import '../data/datasource/binding/local/binding_local.dart';
import '../data/datasource/binding/remote/binding_remote.dart';
import '../data/datasource/datasource_factory.dart';
import '../data/repositories/user_repository_impl.dart';
import '../domain/repositories/UserRepository.dart';
import '../domain/usecases/CheckBindingUseCase.dart';
import '../domain/usecases/LoginUseCase.dart';
import '../presentation/blocs/SignBloc.dart';
import '../presentation/blocs/splash/splash_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

///[NOTE] : input for [Global] data state
final sl = GetIt.instance;

Future<void> init() async {
  final config = Config.getInstance();
  final pref = await SharedPref.getInstance();
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  /// [Flavor]
  /// [Implementation] flavor with different [Environm Env] both ios and android
  sl.registerLazySingleton(() => config);
  sl.registerLazySingleton(() => pref);
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => ApiClient(sharedPreferences: sl()));

  ///network
  sl.registerLazySingleton(() => sl<HttpClient>().dio);
  sl.registerSingleton(HttpClient(config: sl(), pref: sl()));

  ///data [Binding] get data from local/remote
  sl.registerFactory(() => BindingLocal(sl()));
  sl.registerFactory(() => BindingRemote(sl()));

  ///[Core]
  ///

  ///sentry client
  ///

  ///[External]
  ///

  ///[Bloc]
  ///
  sl.registerFactory(() => SplashBloc());
  sl.registerFactory(() => SignInBloc(repo: sl()));
  sl.registerFactory(() => SignBloc());
  sl.registerFactory(
    () => LanguageBloc(
      getPreferredLanguageUseCase: sl(),
      updateLanguageUseCase: sl(),
    ),
  );

  ///[UseCase]
  ///
  sl.registerFactory(() => CheckBindStatusUsecase(sl()));
  sl.registerFactory(() => LoginUseCase(sl()));
  sl.registerFactory(() => GetPreferredLanguageUseCase(sl()));
  sl.registerFactory(() => UpdateLanguageUseCase(sl()));

  ///[Repository]
  ///
  sl.registerFactory<BindingDataSourceFactory>(
    () => BindingDataSourceFactory(bindingLocal: sl(), bindingRemote: sl()),
  );
  sl.registerFactory<UserRepository>(
    () => UserRepositoryImpl(bindingDataSourceFactory: sl()),
  );
  sl.registerFactory<AppRepository>(
    () => AppRepositoryImpl(bindingDataSourceFactory: sl()),
  );
  sl.registerFactory(() => SplashRepo(apiClient: sl(), sharedPreferences: sl()));
  sl.registerFactory(() => AuthRepo(apiClient: sl(), sharedPreferences: sl()));
}
