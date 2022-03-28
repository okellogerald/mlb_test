import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'models/batter.dart';
import 'models/batter_details.dart';
import 'models/batters.dart';
import 'models/game.dart';

Future<List<Game>> getGames(DateTime date) async {
  dynamic month = date.month, day = date.day;
  month = month.toString().length == 2 ? month : '0$month';
  day = day.toString().length == 2 ? day : '0$day';

  try {
    final response = await http.get(Uri.parse(
        'http://gd2.mlb.com/components/game/mlb/year_${date.year}/month_$month/day_$day/master_scoreboard.json'));
    final body = await json.decode(response.body);
    //log(body.toString());
    final jsonGames = body['data']['games']['game'];
    late List<Game> games;
    if (jsonGames is List) {
      games = jsonGames.map((e) => Game.fromJson(e)).toList();
    } else if (jsonGames is Map && jsonGames.isNotEmpty) {
      games = [Game.fromJson(jsonGames)];
    } else if (jsonGames == null) {
      games = [];
    }
    return games;
  } on FormatException catch (_) {
    log('error $_');
    return [];
  }
}

Future<Batters> getBothTeamsBatters(String gameDataDirectory) async {
  final response = await http
      .get(Uri.parse('http://gd2.mlb.com$gameDataDirectory/boxscore.json'));
  final body = await json.decode(response.body);
  final jsonBatters = body['data']['boxscore']['batting'] as List;
  final homeTeamJsonBatters = jsonBatters[0];
  final awayTeamJsonBatters = jsonBatters[1];

  final batters = Batters(
      awayTeamBatters: _getBatterDetails(awayTeamJsonBatters['batter']),
      awayTeamTotals: BatterDetails.fromJson(awayTeamJsonBatters),
      homeTeamBatters: _getBatterDetails(homeTeamJsonBatters['batter']),
      homeTeamTotals: BatterDetails.fromJson(awayTeamJsonBatters));
  return batters;
}

List<Batter> _getBatterDetails(List batters) {
  return batters.map((e) => Batter.fromJson(e)).toList();
}
