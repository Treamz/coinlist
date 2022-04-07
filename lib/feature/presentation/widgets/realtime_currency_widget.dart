import 'package:coinlist/feature/domain/entities/currency_entity.dart';
import 'package:coinlist/feature/presentation/bloc/realtime_market/realtime_market_bloc.dart';
import 'package:coinlist/feature/presentation/bloc/realtime_market/realtime_market_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RealTimeCurrencyWidget extends StatelessWidget {
  const RealTimeCurrencyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<RealTimeMarketBloc, RealTimeMarketState>(
        builder: (context, state) {
          if(state is RealTimeMarketLoading) {
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is RealTimeMarketLoading) {
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is RealTimeMarketLoaded) {
            CurrencyEntity current = state.currencyEntity;
            String base = current.asset_id_base;
            String quote = current.asset_id_quote;
            double rate = current.rate;
            String time = DateFormat('dd MMMM yyyy').format(current.time);
            // return Text('${time}');
            return Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Symbol:"),
                        Text("$base/$quote")
                      ],
                    ),
                    Column(
                      children: [
                        Text("Price:"),
                        Text("\$$rate")
                      ],
                    ),
                    Column(
                      children: [
                        Text("Time:"),
                        Text(time)
                      ],
                    )

                  ],
                ),
              ),
            );
          }
          return Container(
            child: Text("No data"),
          );
        },
      ),
    );
  }
}
