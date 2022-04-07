import 'package:coinlist/feature/presentation/bloc/historical_cubit/historical_cubit.dart';
import 'package:coinlist/feature/presentation/bloc/historical_cubit/historical_state.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LineChartPage extends StatelessWidget {
  const LineChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoricalCubit, HistoricalState>(
        builder: (context, state) {
      if (state is HistoricalError) {
        return Center(
          child: Text("No data"),
        );
      }
      if (state is HistoricalEmpty) {
        return Center(
          child: Text("No data"),
        );
      }
      if (state is HistoricalLoading) {
        return Container(
          height: 200,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (state is HistoricalLoaded) {
        // return Text(state.historyChunkEntity.length.toString());
        return Container(
          height: 200,
          child: DChartLine(
            data: [
              {
                'id': 'Line',
                'data': state.historyChunkEntity,
              },
            ],
            lineColor: (lineData, index, id) => Colors.amber,
          ),
        );
      }
      return Container();
    });
    return Container(
      height: 400,
      child: DChartLine(
        data: const [
          {
            'id': 'Line',
            'data': [
              {'domain': 0, 'measure': 2999},
              {'domain': 2, 'measure': 2555},
              {'domain': 3, 'measure': 4000},
              {'domain': 4, 'measure': 9999},
            ],
          },
        ],
        lineColor: (lineData, index, id) => Colors.amber,
      ),
    );
  }
}
