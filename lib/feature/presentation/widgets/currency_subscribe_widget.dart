import 'package:coinlist/feature/presentation/bloc/historical_cubit/historical_cubit.dart';
import 'package:coinlist/feature/presentation/bloc/realtime_market/realtime_market_bloc.dart';
import 'package:coinlist/feature/presentation/bloc/realtime_market/realtime_market_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencySubscribeWidget extends StatelessWidget {
  CurrencySubscribeWidget({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(child:TextField(
          controller: _textEditingController..text='BTC/USD',
        )),
        SizedBox(width: 20,),
        ElevatedButton(
            onPressed: () {
              print(_textEditingController.text);
              BlocProvider.of<RealTimeMarketBloc>(context,
                  listen: false)
                  .add(Subscribe(query: _textEditingController.text));
              BlocProvider.of<HistoricalCubit>(context)
                  .fetchHistory(_textEditingController.text.toUpperCase());
            },
            child: Text("Subscribe"))
      ],
    );

  }
}
