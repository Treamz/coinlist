import 'package:equatable/equatable.dart';

class HistoryChunkEntity extends Equatable {
  DateTime time_period_start;
  DateTime time_period_end;
  DateTime time_open;
  DateTime time_close;
  double rate_open;
  double rate_high;
  double rate_low;
  double rate_close;

  HistoryChunkEntity(
      {required this.time_period_start,
      required this.time_period_end,
      required this.time_open,
      required this.time_close,
      required this.rate_open,
      required this.rate_high,
      required this.rate_low,
      required this.rate_close});

  @override
  // TODO: implement props
  List<Object?> get props => [
        time_period_start,
        time_period_end,
        time_open,
        time_close,
        rate_open,
        rate_high,
        rate_low,
        rate_close
      ];
}
