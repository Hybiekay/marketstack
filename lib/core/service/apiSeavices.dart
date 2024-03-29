import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class ApiService {
  static const String baseUrl = "http://api.marketstack.com/v1";
  static const String accesskey = "b31c32a36fe82681df75522cbf7174b3";
  Future getAlltickers() async {
    var allTickerUri = Uri.parse("$baseUrl/tickers?access_key=$accesskey");
    final result = await http.get(allTickerUri);
    if (kDebugMode) {
      print(result.statusCode);
      print(result.body);
    }
    AppConstants.tickerList = json.decode(result.body);

    return json.decode(result.body);
  }

  Future getEod(String symbol, String dateFrom, String dateTo) async {
    print("From filter : $dateFrom .....$dateTo,");
    var getEod = Uri.parse(
        "$baseUrl?access_key=$accesskey&symbols=AAPL&date_from=2022-12-29&date_to=2023-01-08");
    final result = await http.get(getEod);
    if (kDebugMode) {
      print(result.statusCode);
    }

    print(result.body);

    return json.decode(result.body);
  }
}
