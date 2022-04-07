import 'dart:convert';

import 'package:coinlist/core/error/exceptions.dart';
import 'package:coinlist/feature/data/models/history_chunk_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
abstract class CurrencyDataSource {

  Future<List<HistoryChunkModel>> fetchHistorical(String query);
}

class CurrencyDataSourceImpl implements CurrencyDataSource {
  final http.Client client;
  CurrencyDataSourceImpl(this.client);

  @override
  Future<List<HistoryChunkModel>> fetchHistorical(String query) async {
    String currentTime = DateFormat('yyyy-MM-ddThh:mm:ss').format(DateTime.now());
    print(currentTime);
    final response = await client.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/$query/history?period_id=1HRS&time_start=2021-01-01T00:00:00&time_end=$currentTime'),headers: {
      'Content-Type': 'application/json',
      'X-CoinAPI-Key': '41BE842C-D998-4CAC-992F-FFAF21CE8705'
    });
    print(response.statusCode);
    if(response.statusCode == 200) {
      final chunks = json.decode(response.body);

      return (chunks as List).map((chunk) => HistoryChunkModel.fromJson(chunk)).toList();
    }
    else {
      throw ServerException();
    }
  }
}
