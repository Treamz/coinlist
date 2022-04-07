import 'package:coinlist/core/error/failure.dart';
import 'package:coinlist/feature/domain/entities/currency_entity.dart';
import 'package:coinlist/feature/domain/entities/history_chunk_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class CurrencyRepository {
  Future<Either<Failure,List<HistoryChunkEntity>>> getHistory(String quer);
}