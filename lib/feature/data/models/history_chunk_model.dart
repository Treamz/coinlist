import 'package:coinlist/feature/domain/entities/history_chunk_entity.dart';

class HistoryChunkModel extends HistoryChunkEntity {
  HistoryChunkModel(
      {required time_period_start,
      required time_period_end,
      required time_open,
      required time_close,
      required rate_open,
      required rate_high,
      required rate_low,
      required rate_close})
      : super(
            time_period_start: time_period_start,
            time_period_end: time_period_end,
            time_open: time_open,
            time_close: time_close,
            rate_open: rate_open,
            rate_high: rate_high,
            rate_low: rate_low,
            rate_close: rate_close);

  factory HistoryChunkModel.fromJson(Map<String, dynamic> json) {
    return HistoryChunkModel(
        time_period_start: DateTime.parse(json["time_period_start"]),
        time_period_end: DateTime.parse(json["time_period_end"]),
        time_open: DateTime.parse(json["time_open"]),
        time_close: DateTime.parse(json["time_close"]),
        rate_open: json["rate_open"],
        rate_high: json["rate_high"],
        rate_low: json["rate_low"],
        rate_close: json["rate_close"]);
  }
}
