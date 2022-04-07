import 'package:coinlist/core/platform/network_info.dart';
import 'package:coinlist/feature/domain/repositories/currency_repository.dart';
import 'package:coinlist/feature/presentation/bloc/historical_cubit/historical_cubit.dart';
import 'package:coinlist/feature/presentation/bloc/realtime_market/realtime_market_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'feature/data/datasource/currency_data_source.dart';
import 'feature/data/repositories/currency_repository_impl.dart';
import 'package:http/http.dart' as http;

import 'feature/domain/usecases/fetch_historical.dart';
final sl = GetIt.instance;

Future<void> init() async {
  // bloc & cubit
  sl.registerFactory(() => RealTimeMarketBloc());
  sl.registerFactory(() => HistoricalCubit(fetchHistorical: sl()));

  // use cases
  sl.registerLazySingleton(() => FetchHistorical(sl()));

  // repos

  sl.registerLazySingleton<CurrencyRepository>(() =>
      CurrencyRepositoryImpl(
          currencyDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<CurrencyDataSource>(
      () => CurrencyDataSourceImpl(http.Client()));

  // core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
