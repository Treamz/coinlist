import 'package:coinlist/feature/presentation/bloc/realtime_market/realtime_market_bloc.dart';
import 'package:coinlist/feature/presentation/bloc/realtime_market/realtime_market_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/material.dart';

import 'feature/presentation/bloc/historical_cubit/historical_cubit.dart';
import 'feature/presentation/pages/main_page.dart';
import 'locator_service.dart' as di;
import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    const title = 'WebSocket Demo';
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<RealTimeMarketBloc>()..add(Subscribe(query: 'BTC/USD'))),
          BlocProvider(create: (context) => sl<HistoricalCubit>()..fetchHistory('BTC/USD'))

        ], child: MaterialApp(title: title, home: MainPage(),theme: ThemeData.dark(),));
  }
}
