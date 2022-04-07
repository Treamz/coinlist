import 'package:coinlist/feature/domain/entities/history_chunk_entity.dart';
import 'package:equatable/equatable.dart';

abstract class HistoricalState extends Equatable {
  HistoricalState();

  @override
  List<Object?> get props => [];
}

class HistoricalEmpty extends HistoricalState {}

class HistoricalLoading extends HistoricalState {}

class HistoricalLoaded extends HistoricalState {
  List historyChunkEntity;

  HistoricalLoaded({required this.historyChunkEntity});

  @override
  List<Object?> get props => [historyChunkEntity];
}

class HistoricalError extends HistoricalState {
  String message;

  HistoricalError({required this.message});

  @override
  List<Object?> get props => [message];
}
