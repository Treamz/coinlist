import 'dart:async';
import 'dart:convert';

import 'package:coinlist/commons/constants.dart';
import 'package:coinlist/core/error/failure.dart';
import 'package:coinlist/feature/data/models/currency_model.dart';
import 'package:coinlist/feature/domain/entities/currency_entity.dart';
import 'package:coinlist/feature/presentation/bloc/realtime_market/realtime_market_event.dart';
import 'package:coinlist/feature/presentation/bloc/realtime_market/realtime_market_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RealTimeMarketBloc
    extends Bloc<RealTimeMarketEvent, RealTimeMarketState> {
  final WebSocketChannel _channel = WebSocketChannel.connect(
    Uri.parse('ws://ws-sandbox.coinapi.io/v1/'),
  );

  RealTimeMarketBloc()
      : super(RealTimeMarketEmpty()) {
    _channel.stream.listen((event) {
      if(event.contains('hearbeat')) {
        add(RealTimeClarEvent());
      }
      if (event.contains("time")) {
        CurrencyEntity entity = CurrencyModel.fromJson(jsonDecode(event));
        add(FetchRealTimeDataEvent(entity: entity));
      }
    });
    on<RealTimeClarEvent>((event, emit) => emit(RealTimeMarketEmpty()));
    on<Subscribe>((event, emit) {
      _channel.sink.add(jsonEncode({
        "type": "hello",
        "apikey": Constants.apiKey,
        "heartbeat": true,
        "subscribe_data_type": ["exrate"],
        "subscribe_filter_asset_id": [event.query.toUpperCase()]
      }));
    });
    on<FetchRealTimeDataEvent>((event, emit)  {
      emit(RealTimeMarketLoaded(currencyEntity: event.entity));
    });
  }

  String failureMessage(Failure failure) {
    switch (failure) {
      default:
        {
          return 'Unexpected Error';
        }
    }
  }

  @override
  Future<void> close() {
    _channel.sink.close();
    return super.close();
  }
}
