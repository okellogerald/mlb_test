import 'package:mlb_test1/source.dart';
import 'inning.dart';
import 'patcher.dart';
import 'team.dart';

class Game {
  final String id, venue, time, status, gameDateDirectory;
  final Team homeTeam, awayTeam;
  final Patcher winningPatcher, losingPatcher;
  final Patcher? savingPatcher;
  final List<Inning> innings;

  const Game(
      {required this.id,
      required this.homeTeam,
      required this.awayTeam,
      required this.venue,
      required this.time,
      required this.status,
      required this.winningPatcher,
      required this.losingPatcher,
      required this.savingPatcher,
      required this.gameDateDirectory,
      required this.innings});

  factory Game.fromJson(var json) {
    final jsonInnings = json['linescore']['inning'] as List?;
    final innings = jsonInnings?.map((e) => Inning.fromJson(e)).toList();
    return Game(
        id: json['id'],
        homeTeam: Team.fromJson(json, TeamStatus.home),
        awayTeam: Team.fromJson(json, TeamStatus.away),
        venue: json['venue'],
        time: json['time'] + json['ampm'],
        status: json['status']['status'],
        winningPatcher: Patcher.fromJson(json['winning_pitcher'], 'WIN'),
        losingPatcher: Patcher.fromJson(json['losing_pitcher'], 'LOSS'),
        savingPatcher: ((json['save_pitcher'] as Map)['id'] as String).isEmpty
            ? null
            : Patcher.fromJson(json['save_pitcher'], 'SAVE'),
        gameDateDirectory: json['game_data_directory'],
        innings: innings ?? []);
  }

  List<Patcher> get patchers => savingPatcher == null
      ? [winningPatcher, losingPatcher]
      : [winningPatcher, losingPatcher, savingPatcher!];

  Team get winningTeam =>
      homeTeam.totalRuns > awayTeam.totalRuns ? homeTeam : awayTeam;

  bool get wasPlayed => status == 'Final';
}
