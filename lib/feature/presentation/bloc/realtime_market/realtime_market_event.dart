import 'package:coinlist/feature/domain/entities/currency_entity.dart';
import 'package:equatable/equatable.dart';

abstract class RealTimeMarketEvent extends Equatable {
  RealTimeMarketEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchRealTimeDataEvent extends RealTimeMarketEvent {
  CurrencyEntity entity;
  FetchRealTimeDataEvent({required this.entity});
}

class RealTimeLoadingEvent extends RealTimeMarketEvent {

}

class RealTimeClarEvent extends RealTimeMarketEvent {

}

class Subscribe extends RealTimeMarketEvent {
  String query;
  Subscribe({required this.query});
}