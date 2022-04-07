import 'package:coinlist/core/error/failure.dart';
import 'package:coinlist/feature/domain/usecases/fetch_historical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'historical_state.dart';

class HistoricalCubit extends Cubit<HistoricalState> {
  FetchHistorical fetchHistorical;

  HistoricalCubit({required this.fetchHistorical}) : super(HistoricalEmpty());

  Future<void> fetchHistory(String query) async {
    emit(HistoricalLoading());

    final failureOrHistory =
        await fetchHistorical(HistoricalParams(query: query));

    failureOrHistory.fold((error) {
      emit(HistoricalError(message: errorMessage(error)));
    }, (result) {
      List lineChat = result
          .asMap()
          .entries
          .map((e) => {"domain": e.key, "measure": e.value.rate_open})
          .toList();
      if (result.isNotEmpty) {
        emit(HistoricalLoaded(historyChunkEntity: lineChat));
      } else {
        emit(HistoricalError(message: 'No data'));
      }
    });
  }

  String errorMessage(Failure failure) {
    switch (failure) {
      default:
        {
          return 'Unexpected Error';
        }
    }
  }
}
