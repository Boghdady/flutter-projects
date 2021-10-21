import 'package:clean_architecture_tdd/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/network_connection/network_info.dart';
import 'core/presentation/util/input_converter.dart';
import 'features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'features/number_trivia/data/repositories/number_trivi_repository_impl.dart';
import 'features/number_trivia/domain/repositories/number_trivia_repository_domain.dart';
import 'features/number_trivia/domain/usecases/get_concrete_number_trivia_usecase.dart';
import 'features/number_trivia/domain/usecases/get_random_number_trivia_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! features -NumberTrivia
  // Bloc
  sl.registerFactory(() => NumberTriviaBloc(
        concreteTrivia: sl(),
        randomTrivia: sl(),
        inputConverter: sl(),
      ));

  // UseCases
  sl.registerLazySingleton(() => GetConcreteNumberTriviaUseCase(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTriviaUseCase(sl()));

  // Repository
  sl.registerLazySingleton<NumberTriviaRepositoryDomain>(
      () => NumberTriviaRepositoryImpl(
            remoteDataSource: sl(),
            localDataSource: sl(),
            networkInfo: sl(),
          ));

  // DataSource
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
      () => NumberTriviaRemoteDataSourceImpl(httpClinet: sl()));
  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
