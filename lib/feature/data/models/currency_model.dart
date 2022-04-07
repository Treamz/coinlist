import 'package:coinlist/feature/domain/entities/currency_entity.dart';

class CurrencyModel extends CurrencyEntity {
  CurrencyModel(
      {required time,
      required asset_id_base,
      required asset_id_quote,
      required rate,
      required type})
      : super(
            time: time,
            asset_id_base: asset_id_base,
            asset_id_quote: asset_id_quote,
            rate: rate,
            type: type);

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
        time: DateTime.parse(json["time"]),
        asset_id_base: json["asset_id_base"],
        asset_id_quote: json["asset_id_quote"],
        rate: double.parse(json["rate"].toString()),
        type: json["type"]);
  }
}
