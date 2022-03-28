import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'models/batter.dart';
import 'models/batter_details.dart';
import 'models/batters.dart';
import 'models/game.dart';

Future<List<Game>> getGames(DateTime date) async {
  final response = await http.get(Uri.parse(
      'http://gd2.mlb.com/components/game/mlb/year_${date.year}/month_${date.month}/day_${date.day}/master_scoreboard.json'));
  final body = await json.decode(response.body);
  final jsonGames = body['data']['games']['game'] as List;
  final games = jsonGames.map((e) => Game.fromJson(e)).toList();
  return games;
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
