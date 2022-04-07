import 'package:coinlist/core/error/exceptions.dart';
import 'package:coinlist/core/error/failure.dart';
import 'package:coinlist/core/platform/network_info.dart';
import 'package:coinlist/feature/data/datasource/currency_data_source.dart';
import 'package:coinlist/feature/data/models/history_chunk_model.dart';
import 'package:coinlist/feature/domain/entities/currency_entity.dart';
import 'package:coinlist/feature/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyDataSource currencyDataSource;
  final NetworkInfo networkInfo;

  CurrencyRepositoryImpl(
      {required this.currencyDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<HistoryChunkModel>>> getHistory(String query) async{
    // TODO: implement getHistory
    if(await networkInfo.isConnected) {

      try {
        final historical = await currencyDataSource.fetchHistorical(query);

        return Right(historical);
      }
      catch(ex) {
        return Left(ServerFailure());
      }
    }
    else {
      return Left(ServerFailure());
    }
  }
}
