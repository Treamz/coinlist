import 'package:coinlist/feature/presentation/bloc/historical_cubit/historical_cubit.dart';
import 'package:coinlist/feature/presentation/bloc/realtime_market/realtime_market_bloc.dart';
import 'package:coinlist/feature/presentation/bloc/realtime_market/realtime_market_event.dart';
import 'package:coinlist/feature/presentation/widgets/currency_subscribe_widget.dart';
import 'package:coinlist/feature/presentation/widgets/line_chart.dart';
import 'package:coinlist/feature/presentation/widgets/realtime_currency_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('CoinApi'),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CurrencySubscribeWidget(),
              SizedBox(
                height: 50,
              ),
              RealTimeCurrencyWidget(),
              SizedBox(
                height: 50,
              ),
              LineChartPage()
            ],
          ),
        ),
      ),
    );
  }
}
