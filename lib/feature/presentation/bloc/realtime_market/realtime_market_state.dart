import 'package:coinlist/feature/domain/entities/currency_entity.dart';
import 'package:equatable/equatable.dart';

abstract class RealTimeMarketState extends Equatable {
  RealTimeMarketState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RealTimeMarketEmpty extends RealTimeMarketState {

}

class RealTimeMarketError extends RealTimeMarketState {

}

class RealTimeMarketLoaded extends RealTimeMarketState {
  CurrencyEntity currencyEntity;
  RealTimeMarketLoaded({required this.currencyEntity});
  @override
  // TODO: implement props
  List<Object?> get props => [currencyEntity];

}

class RealTimeMarketLoading extends RealTimeMarketState {

}