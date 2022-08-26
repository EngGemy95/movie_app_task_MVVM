import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_app/domain/usecase/get_movies_usecase.dart';
import 'package:movies_app/presentation/movies/viewmodel/movies_home_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import './app_prefs.dart';

final instance = GetIt.instance;

// We put async because the shared prefs require await for Future
Future<void> initAppModule() async {
  // App Module , it is a module where we put all generic dependencies

  // shared prefs instance

  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  // app prefs instance
  instance
      .registerLazySingleton<AppPreference>(() => AppPreference(sharedPrefs));

  // dio factory instance
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();

  // App Service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // Repositoy instance
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(), instance()));

  //network info instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
}

unRegisterAll() {
  instance.unregister<SharedPreferences>();
  instance.unregister<AppPreference>();
  instance.unregister<DioFactory>();
  instance.unregister<AppServiceClient>();
  instance.unregister<RemoteDataSource>();
  instance.unregister<Repository>();
  instance.unregister<NetworkInfo>();
}

initMoviesModule() async {
  if (!GetIt.I.isRegistered<GetMoviesUseCase>()) {
    //GetMoviesUseCase instance
    instance
        .registerFactory<GetMoviesUseCase>(() => GetMoviesUseCase(instance()));
    //MoviesViewModel instance
    instance.registerFactory<MoviesViewModel>(
        () => MoviesViewModel(instance(), instance()));
  }
}
