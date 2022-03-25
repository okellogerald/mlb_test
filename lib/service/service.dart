import 'dart:async';
import 'dart:convert';
import 'package:mlb_test1/date.dart';
import 'package:mlb_test1/models/payload.dart';
import 'package:http/http.dart' as http;

Date dates = Date();

//Get response and convert to an object
Future<PayLoad> getData() async {
  final response = await http.get(Uri.parse(
      'http://gd2.mlb.com/components/game/mlb/year_${dates.year}/month_${dates.month}/day_${dates.day}/master_scoreboard.json'));
  var body;
  try {
    if (response.statusCode == 200) {
      body = PayLoad.fromJson(jsonDecode(response.body));
      // print('api service: ${body}');
      return PayLoad.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  } on Exception catch (e) {
    print(e);
    throw e;
  }
}
