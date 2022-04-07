import 'package:equatable/equatable.dart';

class CurrencyEntity extends Equatable {
  DateTime time;
  String asset_id_base;
  String asset_id_quote;
  double rate;
  String type;

  CurrencyEntity(
      {required this.time,
      required this.asset_id_base,
      required this.asset_id_quote,
      required this.rate,
      required this.type});

  @override
  // TODO: implement props
  List<Object?> get props => [time, asset_id_base, asset_id_quote, rate, type];
}
