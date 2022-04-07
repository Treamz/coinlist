import 'package:coinlist/core/error/failure.dart';
import 'package:coinlist/core/usecases/usecase.dart';
import 'package:coinlist/feature/domain/entities/history_chunk_entity.dart';
import 'package:coinlist/feature/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class FetchHistorical extends UseCase<List<HistoryChunkEntity>, HistoricalParams> {
  CurrencyRepository currencyRepository;
  FetchHistorical(this.currencyRepository);

  @override
  Future<Either<Failure, List<HistoryChunkEntity>>> call(HistoricalParams params) async{
    // TODO: implement call
    return await currencyRepository.getHistory(params.query);
  }
}

class HistoricalParams extends Equatable {
  final String query;
  const HistoricalParams({required this.query});

  @override
  // TODO: implement props
  List<Object?> get props => [query];
}